import 'package:fish_redux/fish_redux.dart';

import '../tagList/state.dart';
import 'view.dart';

class KeywordTitle extends Component<KeywordState> {
  KeywordTitle() : super(
      view: buildKeywordTitle
  );
}