import 'package:fish_redux/fish_redux.dart';

import 'topBar/component.dart';
import 'navBar/component.dart';
import 'recommendTab/component.dart';
import 'libraryTab/component.dart';
import '../components/aside/component.dart';

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
            dependencies: Dependencies(slots: {
              'topBar': TopBar().asDependent(TopBarConnector()),
              'navBar': NavBar().asDependent(NavBarConnector()),
              'libraryTab': LibraryTag().asDependent(LibraryTabStateConnector()),
              'recommendTab': RecommendTab().asDependent(RecommendTabConnector()),
            }));
}
