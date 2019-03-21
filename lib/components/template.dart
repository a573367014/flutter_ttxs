import 'package:flutter/material.dart';
import 'dart:math';

Widget _getTagIcon({
  String text,
  Color color,
  List<Color> backgroundColors
}) {
  return Container(
    height: 19,
    width: 28,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: backgroundColors),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(8))
    ),
    child: Text(text, style:TextStyle(
      color: color,
      fontSize: 10,
    )),
  );
}

Widget getBaseTemplate(double width, double height) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xffeeeeee), borderRadius: BorderRadius.circular(6)),
    margin: EdgeInsets.symmetric(horizontal: 4),
    child: Stack(children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
              'https://picsum.photos/200/300?image=' + Random().nextInt(1000).toString(),
              width: width,
              height: height,
              fit: BoxFit.cover)),
      // 多配图
      Positioned(
          left: 8,
          top: 8,
          child: Container(
              constraints: BoxConstraints(minWidth: 42),
              height: 22,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(120, 0, 0, 0),
              ),
              child: Text('2配色',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )))),
      // VIP
      Positioned(
        bottom: 0,
        right: 0,
        child: _getTagIcon(
          backgroundColors: [
            Color(0xFF4D4D4D),
            Color(0xff333333),
          ],
          color: Color(0xFFFFE0B0),
          text: 'VIP'
        ),
      ),
      // 付费
      Positioned(
        bottom: 0,
        right: 0,
        child: _getTagIcon(
          backgroundColors: [
            Color(0xFFEFB65B),
            Color(0xFFEAAB47),
          ],
          color: Colors.white,
          text: 'VIP'
        ),
      ),
      // 视频图标
      // Positioned(
      //   top: 2,
      //   left: 10,
      //   child: Container(
      //     decoration: BoxDecoration(
      //       boxShadow: [BoxShadow(
      //         blurRadius: 20,
      //         color: Color.fromARGB(55, 0, 0, 0),
      //       )]
      //     ),
      //     child: Icon(
      //       IconData(0xe648, fontFamily: 'iconfont'),
      //       size: 30,
      //       color: Colors.white,
      //     ))),
    ]),
  );
}
