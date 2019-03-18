import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

Widget getTagItem(TagState data) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(6)),
    child: Stack(alignment: Alignment(0, 0.7), children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(data.url,
              width: 80, height: 80, fit: BoxFit.cover)),
      Text(
        data.name,
        style: new TextStyle(fontSize: 13, color: Colors.white),
      ),
    ]),
  );
}

// 顶部条
Widget buildTagList(
    List<TagState> tagList, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 80,
    margin: EdgeInsets.only(top: 10),
    child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (BuildContext context, int index) {
          return getTagItem(tagList[index]);
        }),
  );
}
