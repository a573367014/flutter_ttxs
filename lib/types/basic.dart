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

  PageState update(DioHttpHeaders headers) {
    final PageState newState = clone();
    final Map<String, dynamic> pagination =
        jsonDecode(headers['x-pagination'][0]);

    newState
      ..num = pagination['num']
      ..total = pagination['total'] == 0 ? total :  pagination['total']
      ..isOver = pagination['num'] == pagination['total'] || pagination['total'] == 0;

    return newState;
  }
}

class ActionPayload {
  final data;
  final Completer completer;

  ActionPayload({
    this.data, this.completer
  });
}