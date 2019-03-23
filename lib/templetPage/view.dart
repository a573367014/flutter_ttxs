import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../components/keepAliveWrapper.dart';

import 'state.dart';

Widget buildView(IndexPageState state, Dispatch dispatch, ViewService service) {
  return DefaultTabController(
      length: 3, // This is the number of tabs.
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            service.buildComponent('topBar'),
            service.buildComponent('navBar'),
            Expanded(
              child: TabBarView(children: <Widget>[
                KeepAliveWrapper(service.buildComponent('recommendTab')),
                KeepAliveWrapper(service.buildComponent('recommendTab')),
                KeepAliveWrapper(service.buildComponent('recommendTab')),
              ]),
            )
          ],
        )),
      ));
}
