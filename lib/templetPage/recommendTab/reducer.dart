import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecommendTabState> buildReducer() {
  return asReducer<RecommendTabState>(<Object, Reducer<RecommendTabState>>{
    RecommendTabActionEnum.updateTags: _updateTags,
    RecommendTabActionEnum.updateRemKeywords: _updateRemKeywords,
    RecommendTabActionEnum.updateTemplateLists: _updateTemplateLists
  });
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
