import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

enum TopBarActionEnum {
  createAnimation,
  onClickButton
}

class TopBarActionCreator {
  static Action createAnimation(AnimationController controller, Animation animation) {
    return Action(TopBarActionEnum.createAnimation, payload: {
      'controller': controller,
      'animation': animation
    });
  }

  static Action onClickButton() {
    return Action(TopBarActionEnum.onClickButton);
  }
}
