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
