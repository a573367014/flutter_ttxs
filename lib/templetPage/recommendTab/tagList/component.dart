import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';


class TagList extends Component<List<KeywordState>> {
  TagList() : super(
      view: buildTagList
  );
}