import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'dart:async';

import '../../components/keepAliveWrapper.dart';
import '../../components/loadingBar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RecommendTabState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return RefreshIndicator(
    onRefresh: () {
      final completer = new Completer();
      dispatch(RecommendTabActionCreator.onLoadData(completer: completer));
      return completer.future;
    },
    notificationPredicate: (ScrollNotification ntf) {
      final metrics = ntf.metrics;
      final isMainAxis = (metrics.axisDirection == AxisDirection.down ||
          metrics.axisDirection == AxisDirection.up);
      // 上来加载更多
      if (metrics.extentAfter < 500 &&
          !state.pageState.isLoading &&
          !state.pageState.isOver &&
          isMainAxis) {
        state.pageState.isLoading = true;
        dispatch(RecommendTabActionCreator.onLoadTemplate());
      }

      return true;
    },
    child: CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: state.sController,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (index == adapter.itemCount - 1) {
                final List<Widget> list = [adapter.itemBuilder(context, index)];

                if (state.pageState.isLoading) {
                  list.insert(0, loadingBar());
                }

                return Column(children: list);
              } else {
                return KeepAliveWrapper(adapter.itemBuilder(context, index));
              }
            },
            childCount: adapter.itemCount,
          ),
        )
      ],
    ),
  );
//      child: ListView.builder(
//          cacheExtent: 600.0,
//          controller: state.sController,
//          physics: const AlwaysScrollableScrollPhysics(),
//          itemCount: adapter.itemCount,
//          itemBuilder: (BuildContext context, int index) {
//            if (index == adapter.itemCount - 1) {
//              final List<Widget> list = [adapter.itemBuilder(context, index)];
//
//              if (state.pageState.isLoading) {
//                list.insert(0, loadingBar());
//              }
//
//              return Column(children: list);
//            } else {
//              return adapter.itemBuilder(context, index);
//            }
//          }));
}
