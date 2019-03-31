import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

Effect<TemplateListState> buildEffect() {
  return combineEffects(<Object, Effect<TemplateListState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<TemplateListState> ctx) {
  print('templateList effect init');
}

void _dispose(Action action, Context<TemplateListState> ctx) {
  print('templateList effect dispose');
}
