import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';

class PageState {
  int num;
  int size;
  int total;
  bool isOver;
  bool isLoading;

  PageState(
      {this.num = 0,
      this.size = 5,
      this.total = 0,
      this.isOver = false,
      this.isLoading = false});

  PageState clone() {
    return PageState()
      ..num = num
      ..size = size
      ..total = total
      ..isOver = isOver
      ..isLoading = isLoading;
  }

  void update(Response res) {
    final DioHttpHeaders headers = res.headers;
    final Map<String, dynamic> pagination = jsonDecode(headers['x-pagination'][0]);
    bool _isOver = false;

    if (res.data.length < size) {
      _isOver = res.data.length < size;
    }

    this
      ..num = pagination['num'] + 1
      ..total = pagination['total']
      ..isOver = _isOver;
  }
}

class ActionPayload {
  final data;
  final Completer completer;

  ActionPayload({
    this.data, this.completer
  });
}