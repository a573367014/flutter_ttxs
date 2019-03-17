import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class IndexPageState implements Cloneable<IndexPageState> {
  dynamic message;
  ScrollController sController1;
  ScrollController sController2;
  ScrollController sController3;

  @override
  IndexPageState clone() {
    return IndexPageState()
      ..message = message
      ..sController1 = sController1;
  }
}

IndexPageState initState(dynamic params) {
  final IndexPageState state = IndexPageState();
  state.message = '初始化state';
  state.sController1 = ScrollController();
  state.sController2 = ScrollController();
  state.sController3 = ScrollController();
  return state;
}


class EmptyConnector extends ConnOp<IndexPageState, dynamic> {
  @override
  get(IndexPageState state) {
  }

  @override
  void set(IndexPageState state, dynamic substate) {}
}
