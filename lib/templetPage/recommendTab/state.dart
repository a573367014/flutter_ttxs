import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'tagList/state.dart';
import 'templateList/state.dart';
import '../../types/basic.dart';

class RecommendTabState implements Cloneable<RecommendTabState> {
  List<KeywordState> tags = [];
  List<KeywordState> remKeywords = [];
  List<TemplateListState> templateLists = [];
  ScrollController sController;
  PageState pageState = PageState();

  @override
  RecommendTabState clone() {
    return RecommendTabState()
      ..pageState = pageState
      ..tags = tags
      ..remKeywords = remKeywords
      ..sController = sController
      ..templateLists = templateLists;
  }
}

// connector
class TagListConnector extends ConnOp<RecommendTabState, List<KeywordState>> {
  @override
  get(RecommendTabState state) {
    return state.tags;
  }

  @override
  void set(RecommendTabState state, List<KeywordState> tagList);
}

class KeywordTitleConnector extends ConnOp<RecommendTabState, KeywordState> {
  @override
  get(RecommendTabState state) {
    KeywordState data =
        state.remKeywords.length == 0 ? KeywordState() : state.remKeywords[0];
    return data;
  }

  @override
  void set(RecommendTabState state, KeywordState subState);
}
