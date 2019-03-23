import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'view.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';

class TopBarStateStf extends ComponentState<TopBarState> 
  with SingleTickerProviderStateMixin {}

class TopBar extends Component<TopBarState> {
  TopBar() : super(
      effect: buildEffect(),
      reducer: buildReducer(),
      view: buildTopBar
  );

  @override
  TopBarStateStf createState() => TopBarStateStf();
}