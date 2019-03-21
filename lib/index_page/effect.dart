import 'package:fish_redux/fish_redux.dart';

import 'tag_list/state.dart';
import 'action.dart';
import 'state.dart';

import '../models/tag.dart';

Effect<IndexPageState> buildEffect() {
  return combineEffects(<Object, Effect<IndexPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose
  });
}

void _init(Action action, Context<IndexPageState> ctx) {
  print('effect init');
  // 监听滚动事件
  final crl = ctx.state.sController1;
  crl.addListener(() {
    if(ctx.state.topbarVisible != crl.offset < 50) {
      ctx.dispatch(IndexPageActionCreator.updateTopbarVisible(!ctx.state.topbarVisible));
    }
  });

  // 加载tag标签列表
  imagesOrm().select().then((res) {
    final TagListState tagListModel = TagListState.fromJson(res.data);
    ctx.dispatch(IndexPageActionCreator.updateTagList(tagListModel.list));
  }).catchError((e) {
    print(e);
  });
}

void _dispose(Action action, Context<IndexPageState> ctx) {
  print('effect dispose');
  ctx.state.sController1.dispose();
}
