import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IndexPageState> buildReducer() {
  return asReducer<IndexPageState>(<Object, Reducer<IndexPageState>>{
     IndexPageActionEnum.update: _update,
     IndexPageActionEnum.updateTopbarVisible: _updateTopbarVisible
  });
}

IndexPageState _update(IndexPageState state, Action action) {
  final newState = state.clone();
  newState.message = action.payload;
  return newState;
}

IndexPageState _updateTopbarVisible(IndexPageState state, Action action) {
  final newState = state.clone();
  newState.topbarVisible = action.payload;
  return newState;
}
