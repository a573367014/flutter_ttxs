import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TemplateState> buildReducer() {
  return asReducer<TemplateState>(<Object, Reducer<TemplateState>>{
     TopBarActionEnum.createAnimation: _createAnimation,
  });
}

TemplateState _createAnimation(TemplateState state, Action action) {
  final newState = state.clone();
  newState.controller = action.payload['controller'];
  newState.animation = action.payload['animation'];
  return newState;
}