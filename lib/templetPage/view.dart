import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../components/keepAliveWrapper.dart';
import 'state.dart';
import 'action.dart';

Widget buildView(IndexPageState state, Dispatch dispatch, ViewService service) {
  return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            service.buildComponent('topBar'),
            service.buildComponent('navBar'),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification ntf) {
                  final metrics = ntf.metrics;
                  if ((metrics.axisDirection == AxisDirection.down ||
                          metrics.axisDirection == AxisDirection.up) &&
                      state.topBarVisible != metrics.extentBefore < 55) {
                    dispatch(
                      IndexPageActionCreator.updateTopBarVisible(
                          !state.topBarVisible),
                    );

                    state.topBarVisible = !state.topBarVisible;

                    state.topBarState.controller
                        .animateTo(state.topBarVisible ? 0 : 1);
                  }
                },
                child: TabBarView(
                  controller: state.tController,
                  children: <Widget>[
                    KeepAliveWrapper(service.buildComponent('libraryTab')),
                    KeepAliveWrapper(service.buildComponent('recommendTab')),
                    Text('test')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
  );
}
