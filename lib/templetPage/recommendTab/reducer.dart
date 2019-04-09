import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecommendTabState> buildReducer() {
  return asReducer<RecommendTabState>(<Object, Reducer<RecommendTabState>>{
    RecommendTabActionEnum.updateTags: _updateTags,
    RecommendTabActionEnum.updateRemKeywords: _updateRemKeywords,
    RecommendTabActionEnum.updateTemplateLists: _updateTemplateLists,
    RecommendTabActionEnum.updatePageState: _updatePageState,
    RecommendTabActionEnum.init: _init,
  });
}

RecommendTabState _init(RecommendTabState state, Action action) {
  final newState = state.clone();
  newState.sController = ScrollController();
  return newState;
}

RecommendTabState _updateTags(RecommendTabState state, Action action) {
  final newState = state.clone();
  newState.tags = action.payload;
  return newState;
}

RecommendTabState _updateRemKeywords(RecommendTabState state, Action action) {
  final newState = state.clone();
  newState.remKeywords = action.payload;
  return newState;
}

RecommendTabState _updateTemplateLists(RecommendTabState state, Action action) {
  final newState = state.clone();
  newState.templateLists = action.payload;
  return newState;
}

RecommendTabState _updatePageState(RecommendTabState state, Action action) {
  final newState = state.clone();
  newState.pageState = action.payload;
  return newState;
}
