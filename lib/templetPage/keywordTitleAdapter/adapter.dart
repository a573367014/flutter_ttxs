import 'package:fish_redux/fish_redux.dart';

import '../recommendTab/state.dart';
import '../keywordTitle/component.dart';
import '../tagList/state.dart';

//import 'reducer.dart';

class ToDoListAdapter extends DynamicFlowAdapter<RecommendTabState> {
  ToDoListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'toDo': KeywordTitle(),
          },
          connector: _ToDoListConnector()
        );
}

class _ToDoListConnector implements Connector<RecommendTabState, List<ItemBean>> {
  @override
  List<ItemBean> get(RecommendTabState state) {
    if (state.remKeywords?.isNotEmpty == true) {
      final a = state.remKeywords
          .map<ItemBean>((KeywordState data) => ItemBean('toDo', data))
          .toList(growable: true);
      return a;
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(RecommendTabState state, List<ItemBean> toDos) {
    if (toDos?.isNotEmpty == true) {
      state.remKeywords = List<KeywordState>.from(
          toDos.map<KeywordTitle>((ItemBean bean) => bean.data).toList());
    } else {
      state.remKeywords = <KeywordState>[];
    }
  }
}
