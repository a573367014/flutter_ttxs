import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

Widget getMenuItem() {
  return Align(
    child: Container(
      height: 27,
      margin: EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(17),
      ),
      constraints: BoxConstraints(maxWidth: 64, minWidth: 54),
      child: Text('test',
          style: TextStyle(
            color: Color(0xff666666),
            fontSize: 14,
          )),
    ),
  );
}

// 顶部条
Widget buildView(dynamic state, Dispatch dispatch, ViewService viewService) {
  return Align(
      child: Container(
    width: 83.0,
    decoration: BoxDecoration(
        border: Border(
            right: BorderSide(
          color: Color(0xffeeeeee),
          width: 1,
        ))),
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
  ));
}
