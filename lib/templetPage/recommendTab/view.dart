import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'dart:async';

import 'action.dart';
import 'state.dart';


Widget buildView(
    RecommendTabState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return RefreshIndicator(
    child: ListView.builder(
        controller: state.sController,
        itemBuilder: adapter.itemBuilder,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: adapter.itemCount),

    onRefresh: () {
      final completer = new Completer();
      dispatch(RecommendTabActionCreator.onLoadData(completer: completer));
      return completer.future;
    },
  );
}