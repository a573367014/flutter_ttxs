import 'package:fish_redux/fish_redux.dart';
import 'dart:async';
import 'tagList/state.dart';
import 'templateList/state.dart';
import '../../types/basic.dart';

enum RecommendTabActionEnum {
  update,
  updateTags,
  updateRemKeywords,
  updateTemplateLists,
  updatePageState,
  onLoadTemplate,
  onLoadData
}

class RecommendTabActionCreator {
  static Action updateTags(List<KeywordState> list) {
    return Action(RecommendTabActionEnum.updateTags, payload: list);
  }

  static Action updateRemKeywords(List<KeywordState> list) {
    return Action(RecommendTabActionEnum.updateRemKeywords, payload: list);
  }

  static Action updateTemplateLists(List<TemplateListState> list) {
    return Action(RecommendTabActionEnum.updateTemplateLists, payload: list);
  }

  static Action updatePageState(PageState pageState) {
    return Action(RecommendTabActionEnum.updatePageState, payload: pageState);
  }

  static Action onLoadData({
    Completer completer
  }) {
    return Action(RecommendTabActionEnum.onLoadData,
        payload:ActionPayload(completer: completer));
  }

  static Action onLoadTemplate({
    bool replace = false,
    Completer completer
  }) {
    return Action(RecommendTabActionEnum.onLoadTemplate,
        payload: ActionPayload(data: replace, completer: completer));
  }
}
