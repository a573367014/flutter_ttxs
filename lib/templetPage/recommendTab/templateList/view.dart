import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'dart:math';

import '../effect.dart';
import 'state.dart';

// 顶部条
Widget buildView(
    TemplateListState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();

  double height = 0;

  if (state.list.length > 0) {
    height = min(state.list[0].previewInfo.showHeight, TEMPLATE_WIDTH * 16 / 9);
  }

  return Container(
      height: height,
      child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification ntf) {
            // 干扰到垂直滚动条、所以取消冒泡
            return true;
          },
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: adapter.itemBuilder(context, index));
              },
              itemCount: adapter.itemCount)));
}
