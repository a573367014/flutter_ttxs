import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchPageState> buildReducer() {
  return asReducer<SearchPageState>(<Object, Reducer<SearchPageState>>{
     SearchPageActionEnum.updateTController: _updateTController,
  });
}

SearchPageState _updateTController(SearchPageState state, Action action) {
  final newState = state.clone();
  newState.tController = action.payload;
  return newState;
}