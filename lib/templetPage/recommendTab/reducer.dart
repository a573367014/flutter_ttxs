import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TopBarState> buildReducer() {
  return asReducer<TopBarState>(<Object, Reducer<TopBarState>>{
     TopBarActionEnum.createAnimation: _createAnimation,
  });
}

TopBarState _createAnimation(TopBarState state, Action action) {
  final newState = state.clone();
  newState.controller = action.payload['controller'];
  newState.animation = action.payload['animation'];
  return newState;
}