import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LibraryTabState> buildReducer() {
  return asReducer<LibraryTabState>(<Object, Reducer<LibraryTabState>>{
    LibraryTabActionEnum.updateTemplateList: _updateTemplateList,
    LibraryTabActionEnum.updatePageState: _updatePageState
  });
}

LibraryTabState _updateTemplateList(LibraryTabState state, Action action) {
  final newState = state.clone();
  newState.templateList = action.payload;
  return newState;
}

LibraryTabState _updatePageState(LibraryTabState state, Action action) {
  final newState = state.clone();
  newState.pageState = action.payload?.clone();
  return newState;
}
