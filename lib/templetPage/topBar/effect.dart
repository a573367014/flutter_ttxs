import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'component.dart';
import 'state.dart';
import 'action.dart';

Effect<TopBarState> buildEffect() {
  return combineEffects(<Object, Effect<TopBarState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose
  });
}

void _init(Action action, Context<TopBarState> ctx) {
  // stfState = this
  final TickerProvider tickerProvider = ctx.stfState as TopBarStateStf;


  final controller = AnimationController(
      duration: const Duration(milliseconds: 100), vsync: tickerProvider);
  final animation = Tween<double>(begin: 0, end: 55).animate(controller);

  ctx.dispatch(TopBarActionCreator.createAnimation(controller, animation));
}

void _dispose(Action action, Context<TopBarState> ctx) {
  ctx.state.controller.dispose();
}
