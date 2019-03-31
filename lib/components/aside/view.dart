import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import '../../services/uiAdapter.dart';

Widget getMenuItem(int index) {
  return UnconstrainedBox(
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
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(
          Ui.get().sw(34),
        ),
      ),
      constraints: BoxConstraints(minWidth: Ui.get().sw(138)),
      child: Text(
        '测试' + (index > 2 ? index.toString() : ''),
        style: TextStyle(
          color: Color(0xff666666),
          fontSize: Ui.get().sf(28),
        ),
      ),
    ),
  );
}

Widget buildView(dynamic state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: Ui.get().sw(168),
    child: Column(
      children: <Widget>[
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification ntf) {
              return true;
            },
            child: ListView.builder(
              itemCount: 20,
              padding: EdgeInsets.only(
                top: Ui.get().sw(20),
              ),
              itemBuilder: (BuildContext context, int index) {
                return getMenuItem(index);
              },
            ),
          ),
        ),
      ],
    ),
  );
}
