import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../services/uiAdapter.dart';
import 'dart:math';

// 顶部条
Widget buildView(
     state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.only(top: Ui.get().sw(20)),
      child:Row(
        children: <Widget>[
          viewService.buildComponent('aside'),
          Expanded(
            child: viewService.buildComponent('templateList')
          )
        ],
      )
  ) ;
}
