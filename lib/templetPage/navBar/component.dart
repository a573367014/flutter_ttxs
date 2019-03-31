import 'package:fish_redux/fish_redux.dart';
import 'view.dart';
class NavBar extends Component<Map<String, dynamic>> {
  NavBar() : super(
      view: buildNavBar
  );
}