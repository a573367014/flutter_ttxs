import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'topBar/action.dart';
import 'topBar/state.dart';
import 'libraryTab/state.dart';
import 'recommendTab/state.dart';

class IndexPageState implements Cloneable<IndexPageState> {
  bool topBarVisible;
  RecommendTabState recommendTab;
  LibraryTabState libraryTab;
  TopBarState topBarState;
  TabController tController;

  @override
  IndexPageState clone() {
    return IndexPageState()
      ..tController = tController
      ..topBarVisible = topBarVisible
      ..topBarState = topBarState
      ..libraryTab = libraryTab
      ..recommendTab = recommendTab;
  }
}

IndexPageState initState(dynamic params) {
  final IndexPageState state = IndexPageState();
  state.topBarVisible = true;
  state.topBarState = TopBarState();
  state.recommendTab = RecommendTabState();
  state.libraryTab = LibraryTabState();

  return state;
}

// connector
class NavBarConnector extends ConnOp<IndexPageState, Map<String, dynamic>> {
  @override
  get(IndexPageState state) {
    return <String, dynamic>{
      'tController': state.tController,
      'topBarVisible': state.topBarVisible,
      'actionCreator': TopBarActionCreator.onPushSearch
    };
  }

  void set(IndexPageState state, Map<String, dynamic> subState);
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

class LibraryTabStateConnector extends ConnOp<IndexPageState, LibraryTabState> {
  @override
  get(IndexPageState state) {
    return state.libraryTab;
  }

  @override
  void set(IndexPageState state, LibraryTabState subState) {
    state.libraryTab = subState.clone();
  }
}