import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Reducer<LibraryTabState> buildReducer() {
  return asReducer<LibraryTabState>(<Object, Reducer<LibraryTabState>>{
    LibraryTabActionEnum.updateTemplateList: _updateTemplateList,
    LibraryTabActionEnum.updateFuncList: _updateFuncList,
    LibraryTabActionEnum.updateAsideIndex: _updateAsideIndex,
    LibraryTabActionEnum.init: _init,
  });
}

LibraryTabState _init(LibraryTabState state, Action action) {
  final newState = state.clone();
  newState.templateList.sController = ScrollController();
  return newState;
}

LibraryTabState _updateTemplateList(LibraryTabState state, Action action) {
  final newState = state.clone();
  newState.templateList = action.payload;
  return newState;
}

LibraryTabState _updateFuncList(LibraryTabState state, Action action) {
  final newState = state.clone();
  newState.funcList = action.payload?.clone();
  return newState;
}

LibraryTabState _updateAsideIndex(LibraryTabState state, Action action) {
  final newState = state.clone();
  newState.currentIndex = action.payload;
  return newState;
}

