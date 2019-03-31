import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../services/uiAdapter.dart';
import '../loadingBar.dart';

import 'state.dart';

Widget buildView(
    TemplateListState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();

  return StaggeredGridView.countBuilder(
    controller: state.sController,
    padding: EdgeInsets.only(
      left: Ui.get().sw(20),
      right: Ui.get().sw(30),
      top: Ui.get().sw(20),
    ),
    mainAxisSpacing: Ui.get().sw(20.0),
    crossAxisSpacing: Ui.get().sw(20.0),
    itemCount: adapter.itemCount + 1,
    crossAxisCount: 2,
    itemBuilder: (BuildContext context, int index) {
      if (index != adapter.itemCount) {
        return adapter.itemBuilder(context, index);
      } else {
        return loadingBar(active: state.pageState.isOver);
      }
    },
    staggeredTileBuilder: (int index) {
      if (index != adapter.itemCount) {
        return StaggeredTile.extent(
            1, state.list[index].previewInfo.showHeight);
      } else {
        return StaggeredTile.extent(2, 40);
      }
    },
  );
}
