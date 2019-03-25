import 'package:fish_redux/fish_redux.dart';

import 'tagList/component.dart';
import 'keywordTitle/component.dart';
import 'templateList/component.dart';
import 'bottomButtons/component.dart';

import 'state.dart';

class RecommendTabAdapter extends DynamicFlowAdapter<RecommendTabState> {
  RecommendTabAdapter()
      : super(pool: <String, Component<Object>>{
          'recommendTab/tagList': TagList(),
          'title': KeywordTitle(),
          'templateList': TemplateList(),
          'bottomButtons': BottomButtons()
        }, connector: _ToDoListConnector());
}

class _ToDoListConnector
    implements Connector<RecommendTabState, List<ItemBean>> {
  @override
  List<ItemBean> get(RecommendTabState state) {
    List<ItemBean> result = [ItemBean('recommendTab/tagList', state.tags)];

    if (state.remKeywords?.isNotEmpty == true &&
        state.templateLists?.isNotEmpty == true &&
        state.templateLists.length <= state.remKeywords.length) {
      for (int i = 0; i < state.templateLists.length; i++) {
        if (state.templateLists[i].list.length > 0) {
          result.add(ItemBean('title', state.remKeywords[i]));
          result.add(ItemBean('templateList', state.templateLists[i]));
        }
      }
    }

    result.add(ItemBean('bottomButtons', state.sController));
//    print(result.length);
    return result;
  }

  @override
  void set(RecommendTabState state, List<ItemBean> subState) {}
}
