import 'package:fish_redux/fish_redux.dart';
import 'tag_list/state.dart';
import 'action.dart';
import 'state.dart';

Effect<IndexPageState> buildEffect() {
  return combineEffects(<Object, Effect<IndexPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose
  });
}

void _init(Action action, Context<IndexPageState> ctx) {
  print('effect init');

  // 初始化tag数据
  List<TagState> tagList = [
    TagState(url: 'https://picsum.photos/200/300?image=1', id: '1', name: '做活动1'),
    TagState(url: 'https://picsum.photos/200/300?image=2', id: '2', name: '做活动2'),
    TagState(url: 'https://picsum.photos/200/300?image=3', id: '3', name: '做活动3'),
    TagState(url: 'https://picsum.photos/200/300?image=4', id: '4', name: '做活动4'),
    TagState(url: 'https://picsum.photos/200/300?image=5', id: '5', name: '做活动5'),
    TagState(url: 'https://picsum.photos/200/300?image=6', id: '6', name: '做活动6'),
    TagState(url: 'https://picsum.photos/200/300?image=7', id: '7', name: '做活动7'),
  ];
  ctx.dispatch(IndexPageActionCreator.updateTagList(tagList));

  // 监听滚动事件
  final crl = ctx.state.sController1;
  crl.addListener(() {
    if(ctx.state.topbarVisible != crl.offset < 50) {
      ctx.dispatch(IndexPageActionCreator.updateTopbarVisible(!ctx.state.topbarVisible));
    }
  });
}

void _dispose(Action action, Context<IndexPageState> ctx) {
  print('effect dispose');
  ctx.state.sController1.dispose();
}
