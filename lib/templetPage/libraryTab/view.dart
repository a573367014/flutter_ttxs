import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import '../../types/basic.dart';
import '../../services/uiAdapter.dart';

import 'action.dart';
import 'state.dart';

Widget getFilterButton(LibraryTabState state, Dispatch dispatch) {
  return UnconstrainedBox(
    child: GestureDetector(
      onTap: () {
        print('点击筛选');
      },
      child: Container(
        height: Ui.get().sw(64),
        width: Ui.get().sw(128),
        margin: EdgeInsets.only(
          top: Ui.get().sw(42),
          bottom: Ui.get().sw(54),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: Color(0xFFF1F1F1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '筛选',
              style: TextStyle(
                fontSize: Ui.get().sw(28),
                color: Color(0xff333333),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// 顶部条
Widget buildView(
    LibraryTabState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 300,
    child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification ntf) {
                  return true;
                },
                key: state.asideKey,
                child: viewService.buildComponent('aside'),
              ),
            ),
            getFilterButton(state, dispatch),
          ],
        ),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            child: viewService.buildComponent('templateList'),
            onNotification: (ScrollNotification ntf) {
              final PageState pageState = state.templateList.pageState;
              if (ntf.metrics.extentAfter < 600 &&
                  !pageState.isOver &&
                  !pageState.isLoading) {
                pageState.isLoading = true;
                dispatch(LibraryTabActionCreator.onLoadTemplate(params: {
                  'page_num': pageState.num,
                  'page_size': pageState.size,
                }));
              }

              return false;
            },
          ),
        ),
      ],
    ),
  );
}
