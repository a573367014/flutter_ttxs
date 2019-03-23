import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class TopBarState implements Cloneable<TopBarState> {
  AnimationController controller;
  Animation animation;

  TopBarState({
    this.controller,
    this.animation
  });

  @override
  TopBarState clone() {
    return TopBarState()
      ..animation = animation
      ..controller = controller;
  }
}