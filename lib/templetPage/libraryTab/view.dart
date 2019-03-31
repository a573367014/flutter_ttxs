import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import '../../services/uiAdapter.dart';
import '../../types/basic.dart';

import 'action.dart';
import 'state.dart';

// 顶部条
Widget buildView(
    LibraryTabState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Row(
      children: <Widget>[
        viewService.buildComponent('aside'),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            child: viewService.buildComponent('templateList'),
            onNotification: (ScrollNotification ntf) {
              final PageState pageState = state.templateList.pageState;
              if (ntf.metrics.extentAfter < 600 &&
                  !pageState.isOver &&
                  !pageState.isLoading) {
                pageState.isLoading = true;
                dispatch(LibraryTabActionCreator.onLoadTemplate());
              }

              return false;
            },
          ),
        ),
      ],
    ),
  );
}
