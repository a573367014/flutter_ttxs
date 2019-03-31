import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import '../../components/templateList/state.dart';
import '../../types/basic.dart';

class LibraryTabState implements Cloneable<LibraryTabState> {
  TemplateListState templateList = TemplateListState(list: []);
  ScrollController sController = ScrollController();
  PageState pageState = PageState(size: 20);

  @override
  LibraryTabState clone() {
    return LibraryTabState()
      ..pageState = pageState
      ..sController = sController
      ..templateList = templateList;
  }
}

class TemplateListConnector
    implements Connector<LibraryTabState, TemplateListState> {
  @override
  TemplateListState get(LibraryTabState state) {
    return state.templateList..sController = state.sController;
  }

  @override
  void set(LibraryTabState state, TemplateListState templateList) {}
}
