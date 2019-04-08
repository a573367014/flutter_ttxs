import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class SearchPageState implements Cloneable<SearchPageState> {
  bool topBarVisible;
  TabController tController;

  @override
  SearchPageState clone() {
    return SearchPageState()
      ..tController = tController
      ..topBarVisible = topBarVisible;
  }
}

SearchPageState initState(dynamic params) {
  final SearchPageState state = SearchPageState();
  state.topBarVisible = true;

  return state;
}

// connector
class NavBarConnector extends ConnOp<SearchPageState, Map<String, dynamic>> {
  @override
  get(SearchPageState state) {
    return <String, dynamic>{
      'tController': state.tController,
      'topBarVisible': state.topBarVisible
    };
  }

  void set(SearchPageState state, Map<String, dynamic> subState);
}
