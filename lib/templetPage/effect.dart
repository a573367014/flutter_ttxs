import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'action.dart';
import 'state.dart';
import 'page.dart';

Effect<IndexPageState> buildEffect() {
  return combineEffects(<Object, Effect<IndexPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<IndexPageState> ctx) {
  print('effect init');
  Timer timer;
  // stfState = this
  final TickerProvider tickerProvider = ctx.stfState as IndexPageStateStf;

  final controller = TabController(length: 3, vsync: tickerProvider);
  controller.addListener(
    () {
      final libraryTab = ctx.state.libraryTab;
      final recommendTab = ctx.state.recommendTab;
      double offset;

      timer?.cancel();
      timer = Timer(
        Duration(milliseconds: 250),
        () {
          if (controller.index == 0 &&
              libraryTab.templateList.sController != null &&
              libraryTab.templateList.sController.hasClients) {
            offset = libraryTab.templateList.sController.offset;
          } else if (controller.index == 1 &&
              recommendTab.sController.hasClients) {
            offset = recommendTab.sController.offset;
          }

          ctx.dispatch(
            IndexPageActionCreator.updateTopBarVisible(
                offset == null || offset < 55),
          );

          ctx.state.topBarState.controller.animateTo(
            ctx.state.topBarVisible ? 0 : 1,
            duration: Duration(milliseconds: 200),
          );
        },
      );
    },
  );

  ctx.dispatch(IndexPageActionCreator.updateTController(controller));
}

void _dispose(Action action, Context<IndexPageState> ctx) {
  print('effect dispose');
  ctx.state.tController.dispose();
}
