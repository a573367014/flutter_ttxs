import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

import '../../services/uiAdapter.dart';
import 'action.dart';
import 'state.dart';

Widget getMenuItem(AsideState state, Dispatch dispatch, int index) {
  return UnconstrainedBox(
    child: GestureDetector(
      onTap: () {
        dispatch(AsideActionCreator.onChange(index));
      },
      child: Container(
        height: Ui.get().sw(54),
        margin: EdgeInsets.only(
          bottom: Ui.get().sw(48),
        ),
        padding: EdgeInsets.only(
          left: Ui.get().sw(20),
          right: Ui.get().sw(20),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(state.index == index ? 0xff333333 : 0x00000000),
          borderRadius: BorderRadius.circular(
            Ui.get().sw(34),
          ),
        ),
        constraints: BoxConstraints(minWidth: Ui.get().sw(138)),
        child: Text(
          state.list[index],
          style: TextStyle(
            color: Color(state.index == index ? 0xffffffff : 0xff666666),
            fontSize: Ui.get().sf(28),
          ),
        ),
      ),
    ),
  );
}

Widget buildView(AsideState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: Ui.get().sw(168),
    child: Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            controller: state.sController,
            itemCount: state.list.length,
            padding: EdgeInsets.only(
              top: Ui.get().sw(20),
              bottom: Ui.get().sw(100),
            ),
            itemBuilder: (BuildContext context, int index) {
              return getMenuItem(state, dispatch, index);
            },
          ),
        ),
      ],
    ),
  );
}
