import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import '../../../components/keepAliveWrapper.dart';
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

  return KeepAliveWrapper(Container(
      height: height,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          itemBuilder: adapter.itemBuilder,
          itemCount: adapter.itemCount)));
}
