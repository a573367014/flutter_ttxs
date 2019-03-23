import 'package:fish_redux/fish_redux.dart';
import 'tagList/state.dart';

enum IndexPageActionEnum {
  update,
  updateTopBarVisible,
  updateTagList,
  updateRemKeywords
}

class IndexPageActionCreator {
  static Action update(dynamic message) {
    return Action(IndexPageActionEnum.update, payload: message);
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
