import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../../models/attributes.json.dart';
import '../../components/aside/state.dart';
import '../../components/templateList/state.dart';

class LibraryTabState implements Cloneable<LibraryTabState> {
  TemplateListState templateList = TemplateListState(list: []);
  ScrollController sController = ScrollController();

  GlobalKey asideKey = GlobalKey();
  FuncListState funcList = FuncListState([]);
  ScrollController asideSController = ScrollController();
  int currentIndex = 0;

  @override
  LibraryTabState clone() {
    return LibraryTabState()
      ..asideSController = asideSController
      ..asideKey = asideKey
      ..currentIndex = currentIndex
      ..funcList = funcList
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

class AsideConnector
    implements Connector<LibraryTabState, AsideState> {
  @override
  AsideState get(LibraryTabState state) {
    List<String> list = state.funcList.list.map((item) => item.name).toList();
    return AsideState(list: list, index: state.currentIndex, sController: state.asideSController);
  }

  @override
  void set(LibraryTabState state, AsideState subState) {}
}
