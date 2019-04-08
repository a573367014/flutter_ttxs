import 'package:flutter/material.dart';
import 'templetPage/page.dart';
import 'services/uiAdapter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // 初始化ui适配器
    return MaterialApp(home: Builder(builder: (BuildContext context) {
      Ui.instance = Ui()..init(context);
      return IndexPage().buildPage(<String, dynamic>{});
    }));
  }
}
