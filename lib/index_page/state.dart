import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'top_bar/state.dart';
import 'tag_list/state.dart';

class IndexPageState implements Cloneable<IndexPageState> {
  bool topbarVisible;
  List<TagState> tagList = [];

  TopBarState topBarState;
  ScrollController sController1;
  ScrollController sController2;
  ScrollController sController3;

  @override
  IndexPageState clone() {
    return IndexPageState()
      ..topBarState = topBarState
      ..topbarVisible = topbarVisible
      ..tagList = tagList
      ..sController1 = sController1;
  }
}

IndexPageState initState(dynamic params) {
  final IndexPageState state = IndexPageState();
  state.topbarVisible = true;

  state.topBarState = TopBarState();
  state.sController1 = ScrollController();
  state.sController2 = ScrollController();
  state.sController3 = ScrollController();
  return state;
}

class NavbarConnector extends ConnOp<IndexPageState, bool> {
  @override
  get(IndexPageState state) {
    return state.topbarVisible;
  }

  void set(IndexPageState state, bool topbarVisible);
}

class TopbarConnector extends ConnOp<IndexPageState, TopBarState> {
  @override
  get(IndexPageState state) {
    return state.topBarState;
  }

  @override
  void set(IndexPageState state, TopBarState topBarState) {
    state.topBarState = topBarState.clone();
  }
}

class TagListConnector extends ConnOp<IndexPageState, List<TagState>> {
  @override
  get(IndexPageState state) {
    return state.tagList;
  }

  @override
  void set(IndexPageState state, List<TagState> tagList);
}
