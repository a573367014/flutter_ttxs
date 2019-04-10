import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

// 顶部条
Widget buildNavBar(
    Map<String, dynamic> state, Dispatch dispatch, ViewService viewService) {
  final bool topBarVisible = state['topBarVisible'];
  final TabController tController = state['tController'];

  final borderColor = !topBarVisible ? Color(0xffeeeeee) : Colors.transparent;

  return Container(
    height: 60,
    padding: EdgeInsets.only(left: 4, right: 16),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: borderColor))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TabBar(
          controller: tController,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.symmetric(horizontal: 12),
          labelColor: Color(0xFF333333),
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(
            fontSize: 18,
            color: Color(0xff999999),
          ),
          tabs: ['推荐', '图片', '视频']
              .map((menuItem) => Tab(text: menuItem))
              .toList(),
        ),
        Offstage(
          offstage: topBarVisible,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if(state['actionCreator'] is Function) {
                dispatch(state['actionCreator']());
              }
            },
            child: Row(
              children: [
                Icon(IconData(0xe60d, fontFamily: 'iconfont'), size: 18),
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 1),
                  child: Text(
                    '搜索',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
