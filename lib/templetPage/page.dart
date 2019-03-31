import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'navBar/component.dart';
import 'recommendTab/component.dart';
import 'libraryTab/component.dart';
import 'topBar/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class IndexPageStateStf extends ComponentState<IndexPageState>
    with SingleTickerProviderStateMixin {}

class IndexPage extends Page<IndexPageState, dynamic> {
  IndexPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies(
            slots: {
              'topBar': TopBar().asDependent(TopBarConnector()),
              'navBar': NavBar().asDependent(NavBarConnector()),
              'libraryTab':
                  LibraryTag().asDependent(LibraryTabStateConnector()),
              'recommendTab':
                  RecommendTab().asDependent(RecommendTabConnector()),
            },
          ),
        );

  @override
  IndexPageStateStf createState() => IndexPageStateStf();
}
