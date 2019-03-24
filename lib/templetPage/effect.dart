import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

import 'recommendTab/tagList/state.dart';

import '../models/keywords.dart';

Effect<IndexPageState> buildEffect() {
  return combineEffects(<Object, Effect<IndexPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose
  });
}

void _init(Action action, Context<IndexPageState> ctx) {
  print('effect init');

  final crl = ctx.state.recommendTab.sController;
  crl.addListener(() {
    if (ctx.state.topBarVisible != crl.offset < 50) {
      ctx.dispatch(
          IndexPageActionCreator.updateTopBarVisible(!ctx.state.topBarVisible));
      ctx.state.topBarState.controller
          .animateTo(ctx.state.topBarVisible ? 0 : 55);
    }
  });
}

void _dispose(Action action, Context<IndexPageState> ctx) {
  print('effect dispose');
}

void _loadData(Action action, Context<IndexPageState> ctx) {
  Future.wait([
    keywordsModel()
        .select({'type': 0, 'page_num': 1, 'page_size': 1000}),
    keywordsModel()
        .select({'type': 2, 'page_num': 1, 'page_size': 16}),
    keywordsModel()
        .select({'type': 4, 'page_num': 1, 'page_size': 1000})
  ]).then((resList) {
    final KeywordListState tagsModel = KeywordListState.fromJson(resList[0].data);
    ctx.dispatch(IndexPageActionCreator.updateTagList(tagsModel.list));

    final KeywordListState remKeywordsModel = KeywordListState.fromJson(resList[1].data);
    ctx.dispatch(IndexPageActionCreator.updateRemKeywords(remKeywordsModel.list));

  }).catchError((e) {
    print(e);
  });

//  templetsModel().select().then((res) {
//    print(res);
//  }).catchError((e) {
//    print(e);
//  });
}
