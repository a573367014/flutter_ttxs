import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../services/uiAdapter.dart';
import 'state.dart';

Widget buildView(
    TemplateListState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();

  return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(
          left: Ui.get().sw(20),
          right: Ui.get().sw(30)
      ),
      mainAxisSpacing: Ui.get().sw(20.0),
      crossAxisSpacing: Ui.get().sw(20.0),
      itemCount: adapter.itemCount,
      crossAxisCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return adapter.itemBuilder(context, index);
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.extent(1, state.list[index].previewInfo.showHeight),
  );
}
