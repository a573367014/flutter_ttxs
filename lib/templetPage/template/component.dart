import 'package:fish_redux/fish_redux.dart';
import 'view.dart';
import 'state.dart';

class Template extends Component<TemplateState> {
  Template() : super(
      view: buildView
  );
}