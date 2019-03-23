import 'package:fish_redux/fish_redux.dart';
import 'view.dart';
class NavBar extends Component<bool> {
  NavBar() : super(
      view: buildNavBar
  );
}