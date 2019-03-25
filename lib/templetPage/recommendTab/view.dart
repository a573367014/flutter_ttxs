import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RecommendTabState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return RefreshIndicator(
    child: ListView.builder(
        cacheExtent: 10,
        controller: state.sController,
        itemBuilder: adapter.itemBuilder,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: adapter.itemCount),

    onRefresh: () {
      dispatch(RecommendTabActionCreator.onLoadData());
      return _handlerRefresh();
    },
  );
}

Future<Null> _handlerRefresh() async {
  //模拟耗时5秒
  await new Future.delayed(new Duration(seconds: 2));
  return null;
}