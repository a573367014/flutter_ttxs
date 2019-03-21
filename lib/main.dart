import 'package:flutter/material.dart';

import 'index_page/page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(home: IndexPage().buildPage(<String, dynamic>{}));
}


// import 'package:flutter/animation.dart';
// import 'package:flutter/material.dart';
// import 'index_page/top_bar/view.dart';

// class LogoApp extends StatefulWidget {
//   _LogoAppState createState() => new _LogoAppState();
// }

// class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
//   Animation<double> animation;
//   AnimationController controller;

//   initState() {
//     super.initState();
//     controller = new AnimationController(
//         duration: const Duration(milliseconds: 500), vsync: this);
//     animation = new Tween(begin: 0.0, end: 55.0).animate(controller)
//       ..addListener(() {
//         setState(() {
//           // the state that has changed here is the animation object’s value
//         });
//       });
//     controller.forward();
//   }

//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.only(top: 200),
//         decoration: BoxDecoration(color: Colors.black),
//         height: 55 - animation.value,
//         child: Stack(
//           children: <Widget>[
//             Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   height: 55,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       border:
//                           Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 16.0),
//                     alignment: Alignment.center,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text('微商',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 22)),
//                         Container(
//                           height: 32,
//                           width: 123,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(17),
//                               border: Border.all(color: Color(0xffdddddd))),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: <Widget>[
//                                 Icon(IconData(0xe60d, fontFamily: 'iconfont'),
//                                     size: 18),
//                                 Text('搜索',
//                                     style: TextStyle(
//                                         fontSize: 16, color: Colors.black)),
//                                 Container(
//                                     width: 1,
//                                     height: 14,
//                                     color: Color(0xffdddddd)),
//                                 Icon(IconData(0xe600, fontFamily: 'iconfont'),
//                                     size: 20),
//                               ]),
//                         )
//                       ],
//                     ),
//                   ),
//                 ))
//           ],
//         ));
//   }

//   dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

// void main() {
//   runApp(MaterialApp(
//       home: Scaffold(
//     body: new LogoApp(),
//   )));
// }
