import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'dart:math';

import '../../components/template.dart';
import '../../components/keepAliveWrapper.dart';

import 'state.dart';

final List<Map<String, dynamic>> linkData = [
  {'title': '按图片分类查找'},
  {'title': '按视频分类查找'},
  {'title': '按标签查找'},
  {'title': '提供模板建议'},
  {
    'title': '返回顶部',
    'callback': (RecommendTabState state) {
      state.sController.animateTo(0,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    }
  }
];

// 标题
Widget getTitle(String title) {
  return Container(
    padding: EdgeInsets.only(left: 16, right: 12, top: 46, bottom: 17),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Color(0xff333333), fontSize: 16),
        ),
        Row(
          children: <Widget>[
            Text('查看更多',
                style: TextStyle(color: Color(0xFF666666), fontSize: 14)),
            Icon(IconData(0xe601, fontFamily: 'iconfont'), size: 18),
          ],
        )
      ],
    ),
  );
}

// 模板列表
Widget getTemplateList(double width, double height) {
  return Container(
    height: height,
    child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int position) {
          return getBaseTemplate(width, height);
        }),
  );
}

// 底部跳转链接
Widget getBottomLinkItem(int index, RecommendTabState state) {
  final arrowIcon = Icon(IconData(0xe601, fontFamily: 'iconfont'), size: 22);
  final transformArrowIcon = Transform.rotate(
    // 旋转270度
      angle: pi * 1.5,
      child: arrowIcon);
  return GestureDetector(
      onTap: () {
        if (linkData[index]['callback'] != null) {
          linkData[index]['callback'](state);
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

Widget getBottomLinkList(RecommendTabState state) => Container(
    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
    child: Column(
        children: Iterable<int>.generate(linkData.length)
            .map((index) => getBottomLinkItem(index, state))
            .toList()));

// 顶部条
Widget buildView(RecommendTabState state, Dispatch dispatch, ViewService service) {
  return KeepAliveWrapper(
      ListView(controller: state.sController, children: <Widget>[
        service.buildComponent('tagList'),
        service.buildComponent('keywordTitle'),
        service.buildComponent('keywordTitle'),
        service.buildComponent('keywordTitle'),

        getTitle('今日推荐'),
        getTemplateList(116, 208),
        getTitle('今日推荐'),
        getTemplateList(116, 116),
        getTitle('今日推荐'),
        getTemplateList(200, 115),
        getTitle('今日推荐'),
        getTemplateList(116, 116),
        getTitle('今日推荐'),
        getTemplateList(116, 208),
        getTitle('今日推荐'),
        getTemplateList(116, 116),
        getTitle('今日推荐'),
        getTemplateList(200, 115),
        getTitle('今日推荐'),
        getTemplateList(116, 116),
        getTitle('今日推荐'),
        getTemplateList(116, 208),
        getTitle('今日推荐'),
        getTemplateList(116, 116),
        getTitle('今日推荐'),
        getTemplateList(200, 115),
        getTitle('今日推荐'),
        getTemplateList(116, 116),
        getTitle('今日推荐'),
        getTemplateList(116, 116),
        getTitle('今日推荐'),
        getTemplateList(200, 115),
        getTitle('今日推荐'),
        getTemplateList(116, 116),
        getBottomLinkList(state)
      ]));
}
