import 'package:fish_redux/fish_redux.dart';
import 'view.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';

class TopBar extends Component<TemplateState> {
  TopBar() : super(
      effect: buildEffect(),
      reducer: buildReducer(),
      view: buildView
  );
}