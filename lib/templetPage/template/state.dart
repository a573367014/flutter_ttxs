import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class TemplateState implements Cloneable<TemplateState> {
  AnimationController controller;
  Animation animation;

  TemplateState({
    this.controller,
    this.animation
  });

  @override
  TemplateState clone() {
    return TemplateState()
      ..animation = animation
      ..controller = controller;
  }
}