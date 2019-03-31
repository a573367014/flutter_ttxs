import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IndexPageState> buildReducer() {
  return asReducer<IndexPageState>(<Object, Reducer<IndexPageState>>{
     IndexPageActionEnum.updateTopBarVisible: _updateTopBarVisible,
     IndexPageActionEnum.updateTController: _updateTController,
  });
}

IndexPageState _updateTopBarVisible(IndexPageState state, Action action) {
  final newState = state.clone();
  newState.topBarVisible = action.payload;
  return newState;
}

IndexPageState _updateTController(IndexPageState state, Action action) {
  final newState = state.clone();
  newState.tController = action.payload;
  return newState;
}