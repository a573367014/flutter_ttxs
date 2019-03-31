import 'package:flutter/material.dart';

Widget loadingBar({bool active = false}) {
  return Container(
      alignment: Alignment.center,
      child: Text(active ? '后面没有了' : 'loading...',
          style: TextStyle(height: 2, color: Colors.grey, fontSize: 16)));
}
