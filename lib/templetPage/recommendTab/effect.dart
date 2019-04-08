import 'package:fish_redux/fish_redux.dart';
import 'dart:async';

import 'action.dart';
import 'state.dart';

import 'tagList/state.dart';
import 'templateList/state.dart';

import '../../types/basic.dart';
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

  ctx.dispatch(RecommendTabActionCreator.updatePageState(
      (ctx.state.pageState.clone()..isLoading = true)));

  ctx.dispatch(RecommendTabActionCreator.onLoadData(completer: completer));

  completer.future.then((data) {
    ctx.dispatch(RecommendTabActionCreator.updatePageState(
        (ctx.state.pageState.clone()..isLoading = false)));
  }).catchError((e) {});
}

void _dispose(Action action, Context<RecommendTabState> ctx) {
  print('recommendTab effect dispose');
  ctx.state.sController.dispose();
}

// 加载首屏所有数据
Future _loadData(Action action, Context<RecommendTabState> ctx) {
  final ActionPayload payload = action.payload;
  final Completer completer = payload?.completer;

  return Future.wait([
    // 标签
    keywordsModel().select({'type': 0, 'page_num': 1, 'page_size': 1000}),
    // 专题
    keywordsModel().select({'type': 4, 'page_num': 1, 'page_size': 1000})
  ]).then((resList) {
    final KeywordListState tagsModel =
        KeywordListState.fromJson(resList[0].data);
    ctx.dispatch(RecommendTabActionCreator.updateTags(tagsModel.list));
  }).then((nullData) {
    final nextCompleter = Completer();
    ctx.dispatch(RecommendTabActionCreator.onLoadTemplate(
        replace: true,
        completer: nextCompleter
    ));

    return nextCompleter.future;
  }).then((lists) {
    completer?.complete();
  }).catchError((e) {
    print('_loadData:');
    print(e);
    completer?.completeError(e);
  });
}

// 加载关键词模板列表
Future _loadTemplate(Action action, Context<RecommendTabState> ctx) {
  final ActionPayload payload = action.payload;
  // 区分刷新 还是 加载分页
  final bool isReplace = payload.data;

  final Completer completer = payload?.completer;
  PageState newPageState;

  ctx.dispatch(RecommendTabActionCreator.updatePageState(
      ctx.state.pageState.clone()..isLoading = true
  ));

  // 分页加载关键词
  return keywordsModel().select({
    'type': 2,
    'page_num': isReplace ? 1 : ctx.state.pageState.num,
    'page_size': ctx.state.pageState.size
  }).then((res) {
    // 更新分页信息
    newPageState = ctx.state.pageState.clone()..update(res);

    // 发送 reducer 赋值请求
    final KeywordListState remKeywordsModel = KeywordListState.fromJson(res.data);
    final List<KeywordState> newList = isReplace ? [] : List.from(ctx.state.remKeywords);
    newList.addAll(remKeywordsModel.list);
    ctx.dispatch(RecommendTabActionCreator.updateRemKeywords(newList));

    // 更新分页信息
    return remKeywordsModel.list;
  }).then((List<KeywordState> items) {
    // 请求关键词下的模板列表
    Future.wait(items.map((KeywordState item) => templatesModel().select({
          'page_size': 100,
          'page_num': 1,
          'keyword_id': item.keywordId,
          'ref_type': 1,
        }).then((res) {
          // 计算设计稿需要显示的宽高
          res.data.forEach((item) {
            int width = item['preview_info']['width'];
            int height = item['preview_info']['height'];
            item['preview_info']['showWidth'] = TEMPLATE_WIDTH;
            item['preview_info']['showHeight'] =
                TEMPLATE_WIDTH / width * height;
          });

          return TemplateListState.fromJson(res.data);
        }).catchError((e) {
          // 不让请求中断
          print('loadTemplates:');
          print(e);
          return TemplateListState.fromJson([]);
        }))).then((List<TemplateListState> lists) {
      // 发送 reducer 赋值请求
      final List<TemplateListState> newLists = isReplace ? [] : List.from(ctx.state.templateLists);
      newLists.addAll(lists);

      ctx.dispatch(RecommendTabActionCreator.updateTemplateLists(newLists));
      ctx.dispatch(RecommendTabActionCreator.updatePageState(newPageState..isLoading = false));

      return newLists;
    }).then((List<TemplateListState> lists) {
      completer?.complete(lists);
    }).catchError((e) {
      print('_onLoadTemplates foreach:');
      print(e);
      completer?.completeError(e);
    });
  });
}
