import 'package:fish_redux/fish_redux.dart';

enum IndexPageActionEnum { update }

class IndexPageActionCreator {
  static Action update(dynamic message) {
    return Action(
        IndexPageActionEnum.update,
      payload: message
    );
  }
}
