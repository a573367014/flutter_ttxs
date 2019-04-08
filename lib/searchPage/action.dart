import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

enum SearchPageActionEnum {
  updateTController
}

class SearchPageActionCreator {
  static Action updateTController(TabController tController) {
    return Action(SearchPageActionEnum.updateTController, payload: tController);
  }
}
