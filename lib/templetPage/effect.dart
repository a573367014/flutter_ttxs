import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<IndexPageState> buildEffect() {
  return combineEffects(<Object, Effect<IndexPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<IndexPageState> ctx) {
  print('effect init');

  // 监听滚动条，显隐topBar
  final crl = ctx.state.recommendTab.sController;
  crl.addListener(() {
    if (ctx.state.topBarVisible != crl.offset < 50) {
      ctx.dispatch(
          IndexPageActionCreator.updateTopBarVisible(!ctx.state.topBarVisible));

      ctx.state.topBarState.controller
          .animateTo(ctx.state.topBarVisible ? 0 : 55);
    }
  });
}

void _dispose(Action action, Context<IndexPageState> ctx) {
  print('effect dispose');
}