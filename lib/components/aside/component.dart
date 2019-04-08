import 'package:fish_redux/fish_redux.dart';
import 'view.dart';
import 'state.dart';
import 'effect.dart';

class Aside extends Component<AsideState> {
  Aside() : super(
      effect: buildEffect(),
      view: buildView,
  );
}