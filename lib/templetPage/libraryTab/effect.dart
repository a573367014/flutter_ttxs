import 'package:fish_redux/fish_redux.dart';
import 'dart:async';

import '../../models/templates.dart';
import '../../types/basic.dart';
import '../../services/uiAdapter.dart';

import 'action.dart';
import 'state.dart';
import '../../components/templateList/state.dart';
import '../../components/template/state.dart';

Effect<LibraryTabState> buildEffect() {
  return combineEffects(<Object, Effect<LibraryTabState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
    LibraryTabActionEnum.onLoadTemplate: _loadTemplate
  });
}

void _init(Action action, Context<LibraryTabState> ctx) {
  print('recommendTab effect init');
  ctx.dispatch(LibraryTabActionCreator.onLoadTemplate());
}

void _dispose(Action action, Context<LibraryTabState> ctx) {
  print('recommendTab effect dispose');
  ctx.state.sController.dispose();
}

// 加载关键词模板列表
Future _loadTemplate(Action action, Context<LibraryTabState> ctx) {
  final ActionPayload payload = action.payload;
  // 区分刷新 还是 加载分页
  final bool isReplace = payload.data;

  final Completer completer = payload?.completer;
  final PageState pageState = ctx.state.pageState;
  PageState newPageState;

  // 加载中
  ctx.dispatch(LibraryTabActionCreator.updatePageState(
      pageState.clone()..isLoading = true));

  return templatesModel().select({
    'page_size': pageState.size * 10,
    'page_num': pageState.num + 1,
    'ref_type': 1,
  }).then((res) {
    final double uiWidth = Ui.get().sw(254.0);
    // 计算设计稿需要显示的宽高
    res.data.forEach((item) {
      int width = item['preview_info']['width'];
      int height = item['preview_info']['height'];
      item['preview_info']['showWidth'] = uiWidth;
      item['preview_info']['showHeight'] = uiWidth / width * height;
    });

    return TemplateListState.fromJson(res.data);
  }).then((TemplateListState listState) {

    final TemplateListState newTemplateList =
      ctx.state.templateList.clone()..list.addAll(listState.list);


    ctx.dispatch(LibraryTabActionCreator.updateTemplateList(newTemplateList));
    ctx.dispatch(LibraryTabActionCreator.updatePageState(
        newPageState..isLoading = false));
  }).catchError((e) {
    // 不让请求中断
    print('loadTemplates:');
    print(e);
  });
}
