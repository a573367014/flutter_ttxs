import 'package:flutter/material.dart';

class AsideState {
  final List<String> list;
  final ScrollController sController;
  int index;

  AsideState({this.list, this.index, this.sController});
}
