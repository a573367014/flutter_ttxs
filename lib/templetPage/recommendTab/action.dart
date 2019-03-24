import 'package:fish_redux/fish_redux.dart';
import 'tagList/state.dart';
import 'templateList/state.dart';

enum RecommendTabActionEnum {
  update,
  updateTagList,
  updateRemKeywords,
  updateTemplateLists,
  onLoadTemplate
}

class IndexPageActionCreator {
  static Action updateTagList(List<KeywordState> list) {
    return Action(RecommendTabActionEnum.updateTagList, payload: list);
  }

  static Action updateRemKeywords(List<KeywordState> list) {
    return Action(RecommendTabActionEnum.updateRemKeywords, payload: list);
  }

  static Action onLoadTemplate(List<KeywordState> list) {
    return Action(RecommendTabActionEnum.onLoadTemplate, payload: list);
  }

  static Action updateTemplateLists(List<TemplateListState> list) {
    return Action(RecommendTabActionEnum.updateTemplateLists, payload: list);
  }
}
