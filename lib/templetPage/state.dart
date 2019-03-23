import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'topBar/state.dart';
import 'tagList/state.dart';

import 'recommendTab/state.dart';

class IndexPageState implements Cloneable<IndexPageState> {
  bool topBarVisible;
  RecommendTabState recommendTab;
  TopBarState topBarState;

  @override
  IndexPageState clone() {
    return IndexPageState()
      ..topBarVisible = topBarVisible
      ..topBarState = topBarState
      ..recommendTab = recommendTab;
  }
}

IndexPageState initState(dynamic params) {
  final IndexPageState state = IndexPageState();
  state.topBarVisible = true;

  state.topBarState = TopBarState();
  state.recommendTab = RecommendTabState();
  state.recommendTab.sController = ScrollController();

  return state;
}

// connector
class NavBarConnector extends ConnOp<IndexPageState, bool> {
  @override
  get(IndexPageState state) {
    return state.topBarVisible;
  }

  void set(IndexPageState state, bool topBarVisible);
}

class TopBarConnector extends ConnOp<IndexPageState, TopBarState> {
  @override
  get(IndexPageState state) {
    return state.topBarState;
  }

  @override
  void set(IndexPageState state, TopBarState topBarState) {
    state.topBarState = topBarState.clone();
  }
}

class RecommendTabConnector extends ConnOp<IndexPageState, RecommendTabState> {
  @override
  get(IndexPageState state) {
    return state.recommendTab;
  }

  @override
  void set(IndexPageState state, RecommendTabState subState) {
    state.recommendTab = subState.clone();
  }
}