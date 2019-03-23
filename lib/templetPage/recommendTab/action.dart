import 'package:fish_redux/fish_redux.dart';
import '../tagList/state.dart';

enum RecommendTabActionEnum { update, updateTagList, updateRemKeywords }

class IndexPageActionCreator {
  static Action updateTagList(List<KeywordState> tagList) {
    return Action(RecommendTabActionEnum.updateTagList, payload: tagList);
  }

  static Action updateRemKeywords(List<KeywordState> tagList) {
    return Action(RecommendTabActionEnum.updateRemKeywords, payload: tagList);
  }
}
