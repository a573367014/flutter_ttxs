import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'recommendTab/tagList/state.dart';

enum IndexPageActionEnum {
  updateTopBarVisible,
  updateTagList,
  updateRemKeywords,
  updateTController
}

class IndexPageActionCreator {
  static Action updateTController(TabController tController) {
    return Action(IndexPageActionEnum.updateTController, payload: tController);
  }

  static Action updateTopBarVisible(bool topBarVisible) {
    return Action(IndexPageActionEnum.updateTopBarVisible,
        payload: topBarVisible);
  }

  static Action updateTagList(List<KeywordState> tagList) {
    return Action(IndexPageActionEnum.updateTagList,
        payload: tagList);
  }

  static Action updateRemKeywords(List<KeywordState> tagList) {
    return Action(IndexPageActionEnum.updateRemKeywords,
        payload: tagList);
  }
}
