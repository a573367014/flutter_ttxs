import 'package:fish_redux/fish_redux.dart';
import 'dart:math';

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
  _loadData(action, ctx);
}

void _dispose(Action action, Context<RecommendTabState> ctx) {
  print('recommendTab effect dispose');
  ctx.state.sController.dispose();
}

// 加载首屏所有数据
void _loadData(Action action, Context<RecommendTabState> ctx) {
  Future.wait([
    keywordsModel().select({'type': 0, 'page_num': 1, 'page_size': 1000}),
    keywordsModel().select({'type': 2, 'page_num': 1, 'page_size': 100}),
    keywordsModel().select({'type': 4, 'page_num': 1, 'page_size': 1000})
  ]).then((resList) {
    final KeywordListState tagsModel = KeywordListState.fromJson(resList[0].data);
    ctx.dispatch(RecommendTabActionCreator.updateTags(tagsModel.list));

    final KeywordListState remKeywordsModel = KeywordListState.fromJson(resList[1].data);
    ctx.dispatch(RecommendTabActionCreator.updateRemKeywords(remKeywordsModel.list));

    return remKeywordsModel.list;
  }).then((List<KeywordState> list) {
    ctx.dispatch(RecommendTabActionCreator.updateTemplateLists([]));
    ctx.dispatch(RecommendTabActionCreator.onLoadTemplate(list.sublist(0, min(list.length, 100))));
  }).catchError((e) {
    print('_loadData:');
    print(e);
  });
}

// 加载关键词模板列表
Future<List<TemplateListState>> _loadTemplate(
    Action action, Context<RecommendTabState> ctx) {
  final List<TemplateListState> result = [];
  final List<KeywordState> list = action.payload;
  final List<List<KeywordState>> chunks = chunk<KeywordState>(list, 4);

  // 串行加载、避免一次性请求过多被拦截
  return Future.forEach(chunks, (List<KeywordState> kwList) {
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
        item['preview_info']['showHeight'] = TEMPLATE_WIDTH / width * height;
      });

      return TemplateListState.fromJson(res.data);
    }).catchError((e) {
      // 不让请求终端
      print('loadTemplates:');
      print(e);
      return TemplateListState.fromJson([]);
    }))).then((List<TemplateListState> lists) {
      result.addAll(lists);
      final List<TemplateListState> newLists = List.from(ctx.state.templateLists);
      newLists.addAll(lists);
      ctx.dispatch(RecommendTabActionCreator.updateTemplateLists(newLists));
    });
  }).then((nullData) {
    return result;
  }).catchError((e) {
    print('_onLoadTemplates foreach:');
    print(e);
  });
}
