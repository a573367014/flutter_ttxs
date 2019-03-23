import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IndexPageState> buildReducer() {
  return asReducer<IndexPageState>(<Object, Reducer<IndexPageState>>{
     IndexPageActionEnum.updateTopbarVisible: _updateTopbarVisible,
     IndexPageActionEnum.updateTagList : _updateTagList
  });
}

IndexPageState _updateTopbarVisible(IndexPageState state, Action action) {
  final newState = state.clone();
  newState.topbarVisible = action.payload;
  return newState;
}

IndexPageState _updateTagList(IndexPageState state, Action action) {
  final newState = state.clone();
  newState.tagList = action.payload;
  return newState;
}