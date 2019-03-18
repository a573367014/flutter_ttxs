import 'package:fish_redux/fish_redux.dart';
import 'tag_list/state.dart';

enum IndexPageActionEnum { update, updateTopbarVisible, updateTagList }

class IndexPageActionCreator {
  static Action update(dynamic message) {
    return Action(IndexPageActionEnum.update, payload: message);
  }

  static Action updateTopbarVisible(bool topbarVisible) {
    return Action(IndexPageActionEnum.updateTopbarVisible,
        payload: topbarVisible);
  }

  static Action updateTagList(List<TagState> tagList) {
    return Action(IndexPageActionEnum.updateTagList,
        payload: tagList);
  }
}
