import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

class _TopBar extends AnimatedWidget {
  Dispatch dispatch;
  _TopBar(Animation<double> animation, this.dispatch)
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
        height: 55.0 - animation.value, // 0-55
        child: Stack(children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('微商',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                      Container(
                        height: 32,
                        width: 123,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(color: Color(0xffdddddd))),
                        child: GestureDetector(
                          onTap: () {
                            dispatch(TopBarActionCreator.onPushSearch());
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(IconData(0xe60d, fontFamily: 'iconfont'),
                                    size: 18),
                                Text('搜索',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                                Container(
                                    width: 1,
                                    height: 14,
                                    color: Color(0xffdddddd)),
                                Icon(IconData(0xe600, fontFamily: 'iconfont'),
                                    size: 20),
                              ]),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ]));
  }
}

// 顶部条
Widget buildTopBar(
    TopBarState state, Dispatch dispatch, ViewService viewService) {
  return _TopBar(state.animation, dispatch);
}
