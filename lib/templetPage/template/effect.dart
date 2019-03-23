import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'component.dart';
import 'state.dart';
import 'action.dart';

Effect<TemplateState> buildEffect() {
  return combineEffects(<Object, Effect<TemplateState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose
  });
}

void _init(Action action, Context<TemplateState> ctx) {
}

void _dispose(Action action, Context<TemplateState> ctx) {
}
