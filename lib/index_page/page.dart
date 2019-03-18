import 'package:fish_redux/fish_redux.dart';

import 'top_bar/component.dart';
import 'nav_bar/component.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class IndexPage extends Page<IndexPageState, dynamic> {
  IndexPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies(
            slots: {
              'topBar': TopBar().asDependent(TopbarConnector()),
              'navBar': NavBar().asDependent(TopbarConnector()),
            }
          )
  );
}
