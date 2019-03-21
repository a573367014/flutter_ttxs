import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'tag_list/state.dart';

class IndexPageState implements Cloneable<IndexPageState> {
  dynamic message;
  bool topbarVisible;
  List<TagState> tagList = [];

  ScrollController sController1;
  ScrollController sController2;
  ScrollController sController3;

  @override
  IndexPageState clone() {
    return IndexPageState()
      ..message = message
      ..topbarVisible = topbarVisible
      ..tagList = tagList
      ..sController1 = sController1;
  }
}

IndexPageState initState(dynamic params) {
  final IndexPageState state = IndexPageState();
  state.message = '初始化state';
  state.topbarVisible = true;

  state.sController1 = ScrollController();
  state.sController2 = ScrollController();
  state.sController3 = ScrollController();
  return state;
}

class TopbarConnector extends ConnOp<IndexPageState, bool> {
  @override
  get(IndexPageState state) {
    return state.topbarVisible;
  }

  @override
  void set(IndexPageState state, bool topbarVisible);
}

class TagListConnector extends ConnOp<IndexPageState, List<TagState>> {
  @override
  get(IndexPageState state) {
    return state.tagList;
  }

  @override
  void set(IndexPageState state, List<TagState> tagList);
}
