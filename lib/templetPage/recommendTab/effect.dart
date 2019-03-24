import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

import '../tagList/state.dart';

import '../../models/keywords.dart';
import '../../models/templets.dart';

Effect<RecommendTabState> buildEffect() {
  return combineEffects(<Object, Effect<RecommendTabState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose
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

void _loadData(Action action, Context<RecommendTabState> ctx) {
  Future.wait([
    keywordsModel().select({'type': 0, 'page_num': 1, 'page_size': 1000}),
    keywordsModel().select({'type': 2, 'page_num': 1, 'page_size': 100}),
    keywordsModel().select({'type': 4, 'page_num': 1, 'page_size': 1000})
  ]).then((resList) {
    final KeywordListState tagsModel =
        KeywordListState.fromJson(resList[0].data);
    ctx.dispatch(IndexPageActionCreator.updateTagList(tagsModel.list));

    final KeywordListState remKeywordsModel =
        KeywordListState.fromJson(resList[1].data);
    ctx.dispatch(
        IndexPageActionCreator.updateRemKeywords(remKeywordsModel.list));
  }).catchError((e) {
    print(e);
  });

//  templetsModel().select().then((res) {
//    print(res);
//  }).catchError((e) {
//    print(e);
//  });
}
