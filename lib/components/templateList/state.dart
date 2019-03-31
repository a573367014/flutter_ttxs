import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import '../../types/basic.dart';
import '../template/state.dart';

class TemplateListState implements Cloneable<TemplateListState> {
  List<TemplateState> list;
  ScrollController sController;
  PageState pageState = PageState(size: 20);

  TemplateListState({
    this.list,
    this.sController,
    pageState
  }) {
    if(pageState != null) {
      this.pageState = pageState;
    }
  }

  factory TemplateListState.fromJson(List<dynamic> parsedJson) {
    List<TemplateState> _list = List<TemplateState>();
    _list = parsedJson.map((json) => TemplateState.fromJson(json)).toList();
    return TemplateListState(
      list: _list
    );
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  TemplateListState clone() {
    return TemplateListState()
      ..sController = sController
      ..pageState = pageState.clone()
      ..list = List.from(list);
  }
}