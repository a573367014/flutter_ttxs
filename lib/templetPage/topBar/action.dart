import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

enum TopBarActionEnum { createAnimation }

class TopBarActionCreator {
  static Action createAnimation(AnimationController controller, Animation animation) {
    return Action(TopBarActionEnum.createAnimation, payload: {
      'controller': controller,
      'animation': animation
    });
  }
}
