import 'package:fish_redux/fish_redux.dart';
import 'tagList/state.dart';
import 'templateList/state.dart';

enum RecommendTabActionEnum {
  update,
  updateTags,
  updateRemKeywords,
  updateTemplateLists,
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

  static Action onLoadData() {
    return Action(RecommendTabActionEnum.onLoadData);
  }

  static Action onLoadTemplate(List<KeywordState> list) {
    return Action(RecommendTabActionEnum.onLoadTemplate, payload: list);
  }
}
