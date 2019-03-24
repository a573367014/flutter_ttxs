import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import '../tagList/state.dart';

Widget buildKeywordTitle(
    KeywordState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.only(left: 16, right: 12, top: 46, bottom: 17),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: state.keyword != null ? <Widget>[
        Text(
          state.keyword,
          style: TextStyle(color: Color(0xff333333), fontSize: 16),
        ),
        Row(
          children: <Widget>[
            Text('查看更多',
                style: TextStyle(color: Color(0xFF666666), fontSize: 14)),
            Icon(IconData(0xe601, fontFamily: 'iconfont'), size: 18),
          ],
        )
      ] : <Widget>[],
    ),
  );
}
