import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

// 顶部条
Widget buildTopBar(bool topbarVisible, Dispatch dispatch, ViewService viewService) {
  return !topbarVisible ? Container(height: 0, width: 0,) : Container(
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(IconData(0xe60d, fontFamily: 'iconfont'), size: 18),
                    Text('搜索',
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                    Container(width: 1, height: 14, color: Color(0xffdddddd)),
                    Icon(IconData(0xe600, fontFamily: 'iconfont'), size: 20),
                  ]),
            )
          ],
        ),
      ));
}