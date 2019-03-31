import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import '../../components/loadingBar.dart';
import 'dart:async';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RecommendTabState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();

  return RefreshIndicator(
    notificationPredicate: (ScrollNotification notification) {
      if (notification.metrics.extentAfter < 500 &&
          !state.pageState.isLoading &&
          !state.pageState.isOver) {
        dispatch(RecommendTabActionCreator.onLoadTemplate());
      }
      // 继续冒泡
      return false;
    },
    child: ListView.builder(
        cacheExtent: 600.0,
        controller: state.sController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: adapter.itemCount,
        itemBuilder: (BuildContext context, int index) {
          if (index == adapter.itemCount - 1) {
            final List<Widget> list = [adapter.itemBuilder(context, index)];

            if (state.pageState.isLoading) {
              list.insert(0, loadingBar());
            }

            return Column(children: list);
          } else {
            return adapter.itemBuilder(context, index);
          }
        }),
    onRefresh: () {
      final completer = new Completer();
      dispatch(RecommendTabActionCreator.onLoadData(completer: completer));
      return completer.future;
    },
  );
}
