import 'package:fish_redux/fish_redux.dart';
import 'dart:async';
import 'tagList/state.dart';
import 'templateList/state.dart';

enum RecommendTabActionEnum {
  update,
  updateTags,
  updateRemKeywords,
  updateTemplateLists,
  updateIsLoading,
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

  static Action updateIsLoading(bool isLoading) {
    return Action(RecommendTabActionEnum.updateIsLoading, payload: isLoading);
  }

  static Action onLoadData({
    Completer completer
  }) {
    return Action(RecommendTabActionEnum.onLoadData,
        payload:ActionPayload(completer: completer));
  }

  static Action onLoadTemplate(List<KeywordState> list, {
    Completer completer
  }) {
    return Action(RecommendTabActionEnum.onLoadTemplate,
        payload: ActionPayload(data: list, completer: completer));
  }
}

class ActionPayload {
  final data;
  final Completer completer;

  ActionPayload({
    this.data, this.completer
  });
}