import 'package:fish_redux/fish_redux.dart';

import 'view.dart';
import 'state.dart';
import 'adapter.dart';

class TemplateList extends Component<TemplateListState> {
  TemplateList()
      : super(
            view: buildView,
            dependencies: Dependencies(
                adapter: TemplateListAdapter()
            ));
}
