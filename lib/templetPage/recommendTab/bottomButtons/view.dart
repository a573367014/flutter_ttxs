import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'dart:math';

final List<Map<String, dynamic>> linkData = [
  {'title': '按图片分类查找'},
  {'title': '按视频分类查找'},
  {'title': '按标签查找'},
  {'title': '提供模板建议'},
  {
    'title': '返回顶部',
    'callback': (ScrollController controller) {
      // 0 会触发下拉
      // https://github.com/flutter/flutter/issues/26833
      // controller.jumpTo(0.1);
      controller.animateTo(0,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    }
  }
];

// 底部跳转链接
Widget getBottomLinkItem(int index, ScrollController controller) {
  final arrowIcon = Icon(IconData(0xe601, fontFamily: 'iconfont'), size: 22);
  final transformArrowIcon = Transform.rotate(
      // 旋转270度
      angle: pi * 1.5,
      child: arrowIcon);
  return GestureDetector(
      onTap: () {
        if (linkData[index]['callback'] != null) {
          linkData[index]['callback'](controller);
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Color(0xffeeeeee)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              linkData[index]['title'],
              style: TextStyle(color: Color(0xff666666), fontSize: 16),
            ),
            index == 4 ? transformArrowIcon : arrowIcon
          ],
        ),
      ));
}

// 顶部条
Widget buildView(
    ScrollController controller, Dispatch dispatch, ViewService viewService) {
  return Container(
      padding: EdgeInsets.only(top: 50, bottom: 30, left: 16, right: 16),
      child: Column(
          children: Iterable<int>.generate(linkData.length)
              .map((index) => getBottomLinkItem(index, controller))
              .toList()));
}
