import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<IndexPageState> buildEffect() {
  return combineEffects(<Object, Effect<IndexPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose
  });
}

void _init(Action action, Context<IndexPageState> ctx) {
  print('effect init');
  final crl = ctx.state.sController1;
  crl.addListener(() {
    if(ctx.state.topbarVisible != crl.offset < 50) {
      ctx.dispatch(IndexPageActionCreator.updateTopbarVisible(!ctx.state.topbarVisible));
    }
  });
}

void _dispose(Action action, Context<IndexPageState> ctx) {
  print('effect dispose');
  ctx.state.sController1.dispose();
}
