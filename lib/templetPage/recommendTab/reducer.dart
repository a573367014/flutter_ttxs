import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecommendTabState> buildReducer() {
  return asReducer<RecommendTabState>(<Object, Reducer<RecommendTabState>>{
    RecommendTabActionEnum.updateTagList: _updateTagList,
    RecommendTabActionEnum.updateRemKeywords: _updateRemKeywords,
  });
}

RecommendTabState _updateTagList(RecommendTabState state, Action action) {
  final newState = state.clone();
  newState.tagList = action.payload;
  return newState;
}

RecommendTabState _updateRemKeywords(RecommendTabState state, Action action) {
  final newState = state.clone();
  newState.remKeywords = action.payload;
  return newState;
}
