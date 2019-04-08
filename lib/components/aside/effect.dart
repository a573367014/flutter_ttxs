import 'package:fish_redux/fish_redux.dart';
import 'state.dart';
import 'action.dart';

Effect<AsideState> buildEffect() {
  return combineEffects(<Object, Effect<AsideState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<AsideState> ctx) {
  print('aside effect init');
}

void _dispose(Action action, Context<AsideState> ctx) {
  print('aside effect dispose');
}