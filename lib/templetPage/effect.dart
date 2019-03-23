import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

import 'tagList/state.dart';

import '../models/keywords.dart';
import '../models/templets.dart';

Effect<IndexPageState> buildEffect() {
  return combineEffects(<Object, Effect<IndexPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose
  });
}

void _init(Action action, Context<IndexPageState> ctx) {
  print('effect init');

  // 监听滚动事件
  final crl = ctx.state.sController1;
  crl.addListener(() {
    if(ctx.state.topbarVisible != crl.offset < 50) {
      ctx.dispatch(IndexPageActionCreator.updateTopbarVisible(!ctx.state.topbarVisible));
      ctx.state.topBarState.controller.animateTo(ctx.state.topbarVisible ? 0 : 55);
    }
  });

  // 加载tag标签列表
  keywordsModel().select({
    'type': 0,
    'page_num': 1,
    'page_size': 1000
  }).then((res) {
    final KeywordListState tagListModel = KeywordListState.fromJson(res.data);
    ctx.dispatch(IndexPageActionCreator.updateTagList(tagListModel.list));
  }).catchError((e) {
    print(e);
  });

  // 关键词推荐
  keywordsModel().select({
    'type': 2,
    'page_num': 1,
    'page_size': 16
  }).then((res) {
    print(res);
  }).catchError((e) {
    print(e);
  });

  // 专栏
  keywordsModel().select({
    'type': 4,
    'page_num': 1,
    'page_size': 1000
  }).then((res) {
    print(res);
  }).catchError((e) {
    print(e);
  });

//  templetsModel().select().then((res) {
//    print(res);
//  }).catchError((e) {
//    print(e);
//  });
}

void _dispose(Action action, Context<IndexPageState> ctx) {
  print('effect dispose');
  ctx.state.sController1.dispose();
}
