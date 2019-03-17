import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<IndexPageState> buildEffect() {
  return combineEffects(<Object, Effect<IndexPageState>>{
    Lifecycle.initState: _init
  });
}

void _init(Action action, Context<IndexPageState> ctx) {
  print('effect init');
}
