import 'package:fish_redux/fish_redux.dart';

enum IndexPageActionEnum { update, updateTopbarVisible }

class IndexPageActionCreator {
  static Action update(dynamic message) {
    return Action(IndexPageActionEnum.update, payload: message);
  }

  static Action updateTopbarVisible(bool topbarVisible) {
    return Action(IndexPageActionEnum.updateTopbarVisible,
        payload: topbarVisible);
  }
}
