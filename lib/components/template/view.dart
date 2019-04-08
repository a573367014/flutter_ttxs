import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'state.dart';

Widget _getTagIcon({String text, Color color, List<Color> backgroundColors}) {
  return Container(
    height: 19,
    width: 28,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: backgroundColors),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(6),
        bottomRight: Radius.circular(6),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 10,
      ),
    ),
  );
}

Widget _getVipIcon(TemplateState state) {
  return Positioned(
    bottom: 0,
    right: 0,
    child: Offstage(
      offstage: state.grade == 0,
      child: _getTagIcon(backgroundColors: [
        Color(0xFF4D4D4D),
        Color(0xff333333),
      ], color: Color(0xFFFFE0B0), text: 'VIP'),
    ),
  );
}

Widget _getPriceIcon(TemplateState state) {
  return Positioned(
    bottom: 0,
    right: 0,
    child: Offstage(
      offstage: state.price == 0,
      child: _getTagIcon(backgroundColors: [
        Color(0xFFEFB65B),
        Color(0xFFEAAB47),
      ], color: Colors.white, text: '付费'),
    ),
  );
}

// 顶部条
Widget buildView(
    TemplateState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xffeeeeee), borderRadius: BorderRadius.circular(6)),
    child: Stack(alignment: Alignment.center, children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(6),
        //Random().nextInt(1000).toString()
        child: CachedNetworkImage(
            imageUrl: state.previewInfo.url +
                '?x-oss-process=image/resize,w_232/interlace,1',
            width: state.previewInfo.showWidth,
            height: state.previewInfo.showHeight,
            fadeInDuration: Duration(milliseconds: 200),
            alignment: Alignment.center,
            fit: BoxFit.cover),
      ),
      // 多配图
      Positioned(
        left: 8,
        top: 8,
        child: Offstage(
          offstage: state.rulesCount == 0,
          child: Container(
            constraints: BoxConstraints(minWidth: 42),
            height: 22,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(120, 0, 0, 0),
            ),
            child: Text(
              state.rulesCount.toString() + '配色',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      // VIP
      _getVipIcon(state),
      // 付费
      _getPriceIcon(state),
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
