import 'package:fish_redux/fish_redux.dart';

enum AsideActionEnum {
  onChange,
}

class AsideActionCreator {
  static Action onChange(int index) {
    return Action(AsideActionEnum.onChange, payload: index);
  }
}
