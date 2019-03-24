import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

Widget buildView(
    RecommendTabState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return ListView.builder(
      controller: state.sController,
      itemBuilder: adapter.itemBuilder,
      itemCount: adapter.itemCount);
}
