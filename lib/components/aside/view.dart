import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

Widget getMenuItem() {
  return Container(
    height: 27,
    margin: EdgeInsets.symmetric(vertical: 13),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(17),
    ),
    constraints: BoxConstraints(maxWidth: 74),
    child: Text('test',
        style: TextStyle(
          color: Color(0xff666666),
          fontSize: 14,
        )),
  );
}

// 顶部条
Widget buildNavBar(
    dynamic state, Dispatch dispatch, ViewService viewService) {
  return Row(children: [Container(
    width: 83.0,
    decoration: BoxDecoration(
        color: Colors.grey,
      border: Border(right: BorderSide(
          color: Color(0xffeeeeee),
          width: 1,
      ))
    ),
    child: Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return getMenuItem();
              }),
        )
      ],
    ),
  )]);
}
