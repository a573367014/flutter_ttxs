import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IndexPageState> buildReducer() {
  return asReducer<IndexPageState>(<Object, Reducer<IndexPageState>>{
     IndexPageActionEnum.update: _update
  });
}

IndexPageState _update(IndexPageState state, Action action) {
  final newState = state.clone();
  newState.message = action.payload;
  return newState;
}
