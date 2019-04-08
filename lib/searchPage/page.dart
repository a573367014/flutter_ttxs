import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchPageStateStf extends ComponentState<SearchPageState>
    with SingleTickerProviderStateMixin {}

class SearchPage extends Page<SearchPageState, dynamic> {
  SearchPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies(
            slots: {
            },
          ),
        );

  @override
  SearchPageStateStf createState() => SearchPageStateStf();
}
