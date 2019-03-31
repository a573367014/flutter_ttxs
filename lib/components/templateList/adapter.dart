import 'package:fish_redux/fish_redux.dart';
import '../template/component.dart';

import 'state.dart';

class TemplateListAdapter extends DynamicFlowAdapter<TemplateListState> {
  TemplateListAdapter()
      : super(pool: <String, Component<Object>>{
    'template': Template(),
  }, connector: _TemplateConnector());
}

class _TemplateConnector extends ConnOp<TemplateListState, List<ItemBean>> {
  @override
  get(TemplateListState state) {
    final result = state.list.map((item) => ItemBean('template', item)).toList();
    return result;
  }

  @override
  void set(TemplateListState state, List<ItemBean> subState);
}