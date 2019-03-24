import 'package:fish_redux/fish_redux.dart';

import 'tagList/component.dart';
import 'package:flutter_app/templetPage/recommendTab/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'adapter.dart';

class RecommendTab extends Component<RecommendTabState> {
  RecommendTab()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies(
                adapter: RecommendTabAdapter(),
                slots: {'recommendTab/tagList': TagList().asDependent(TagListConnector())}));
}
