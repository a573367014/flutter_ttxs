import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'dart:async';
import '../../utils/utils.dart';

import 'action.dart';
import 'state.dart';

import 'tagList/state.dart';
import 'templateList/state.dart';

import '../../models/keywords.dart';
import '../../models/templates.dart';

const TEMPLATE_WIDTH = 116.0;

Effect<RecommendTabState> buildEffect() {
  return combineEffects(<Object, Effect<RecommendTabState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
    RecommendTabActionEnum.onLoadData: _loadData,
    RecommendTabActionEnum.onLoadTemplate: _loadTemplate
  });
}

void _init(Action action, Context<RecommendTabState> ctx) {
  print('recommendTab effect init');

  final Completer completer = Completer();
  ctx.dispatch(
      RecommendTabActionCreator.updateIsLoading(true));

  ctx.dispatch(
      RecommendTabActionCreator.onLoadData(completer: completer));

  completer.future.then((data) {
    ctx.dispatch(
        RecommendTabActionCreator.updateIsLoading(false));
  }).catchError((e) {

  });
}

void _dispose(Action action, Context<RecommendTabState> ctx) {
  print('recommendTab effect dispose');
  ctx.state.sController.dispose();
}

// 加载首屏所有数据
void _loadData(Action action, Context<RecommendTabState> ctx) {
  final ActionPayload payload = action.payload;
  final Completer completer = payload?.completer;

  Future.wait([
    // 标签
    keywordsModel().select({'type': 0, 'page_num': 1, 'page_size': 1000}),
    // 模板
    keywordsModel().select({'type': 2, 'page_num': 1, 'page_size': 100}),
    // 专题
    keywordsModel().select({'type': 4, 'page_num': 1, 'page_size': 1000})
  ]).then((resList) {
    final KeywordListState tagsModel =
        KeywordListState.fromJson(resList[0].data);
    ctx.dispatch(RecommendTabActionCreator.updateTags(tagsModel.list));

    final KeywordListState remKeywordsModel =
        KeywordListState.fromJson(resList[1].data);

    ctx.dispatch(
        RecommendTabActionCreator.updateRemKeywords(remKeywordsModel.list));

    return remKeywordsModel.list;
  }).then((List<KeywordState> list) {
    ctx.dispatch(RecommendTabActionCreator.updateTemplateLists([]));

    final nextCompleter = Completer();
    ctx.dispatch(
        RecommendTabActionCreator.onLoadTemplate(list.sublist(0, 5), completer: nextCompleter));

    nextCompleter.future.then((data) {
      completer?.complete(data);
    });
  }).catchError((e) {
    print('_loadData:');
    print(e);
    completer?.completeError(e);
  });
}

// 加载关键词模板列表
void _loadTemplate(Action action, Context<RecommendTabState> ctx) {
  final ActionPayload payload = action.payload;
  final List<KeywordState> list = payload?.data ?? [];
  final Completer completer = payload?.completer;

  final List<TemplateListState> result = [];
  final List<List<KeywordState>> chunks = chunk<KeywordState>(list, 4);

  // 串行加载、避免一次性请求过多被拦截
  Future.forEach(chunks, (List<KeywordState> kwList) {
    return Future.wait(kwList.map((item) => templatesModel().select({
          'page_size': 100,
          'page_num': 1,
          'keyword_id': item.keywordId,
          'ref_type': 1,
        }).then((res) {
          // 计算实际显示的宽高
          res.data.forEach((item) {
            int width = item['preview_info']['width'];
            int height = item['preview_info']['height'];
            item['preview_info']['showWidth'] = TEMPLATE_WIDTH;
            item['preview_info']['showHeight'] =
                TEMPLATE_WIDTH / width * height;
          });

          return TemplateListState.fromJson(res.data);
        }).catchError((e) {
          // 不让请求终端
          print('loadTemplates:');
          print(e);
          return TemplateListState.fromJson([]);
        })
      )
    ).then((List<TemplateListState> lists) {
      result.addAll(lists);

      final List<TemplateListState> newLists =
          List.from(ctx.state.templateLists);
      newLists.addAll(lists);
      ctx.dispatch(RecommendTabActionCreator.updateTemplateLists(newLists));
    });
  }).then((nullData) {
    completer?.complete(result);
  }).catchError((e) {
    print('_onLoadTemplates foreach:');
    print(e);
    completer?.completeError(e);
  });
}
