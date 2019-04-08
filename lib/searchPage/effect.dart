import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

Effect<SearchPageState> buildEffect() {
  return combineEffects(<Object, Effect<SearchPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<SearchPageState> ctx) {
  print('effect init');
}

void _dispose(Action action, Context<SearchPageState> ctx) {
  print('effect dispose');
}
