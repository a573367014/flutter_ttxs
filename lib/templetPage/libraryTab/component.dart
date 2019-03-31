import 'package:fish_redux/fish_redux.dart';

import 'view.dart';
import 'effect.dart';
import 'state.dart';
import 'reducer.dart';
import '../../components/aside/component.dart';
import '../../components/templateList/component.dart';

class LibraryTag extends Component<LibraryTabState> {
  LibraryTag() : super(
      effect: buildEffect(),
      reducer: buildReducer(),
      view: buildView,
      dependencies: Dependencies(
          slots: {
            'templateList': TemplateList().asDependent(TemplateListConnector()),
            'aside': Aside().asDependent(TemplateListConnector())
          }));
}
