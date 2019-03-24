import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import '../../../components/template/state.dart';
import 'state.dart';

// 顶部条
Widget buildView(
    TemplateListState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();

  double height = 0;

  if(state.list.length > 0) {
    height = state.list[0].previewInfo.showHeight;
  }

  return Container(
    height: height,
    child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: adapter.itemBuilder,
        itemCount: adapter.itemCount
  ));
}
