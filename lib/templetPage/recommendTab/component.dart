import 'package:fish_redux/fish_redux.dart';

import '../tagList/component.dart';
import '../keywordTitle/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecommendTab extends Component<RecommendTabState> {
  RecommendTab()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies(slots: {
              'tagList': TagList().asDependent(TagListConnector()),
              'keywordTitle':
                  KeywordTitle().asDependent(KeywordTitleConnector()),
            }));
}
