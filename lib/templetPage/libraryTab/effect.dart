import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../models/templates.dart';
import '../../models/attributes.dart';

import '../../types/basic.dart';
import '../../services/uiAdapter.dart';

import 'action.dart';
import 'state.dart';

import '../../components/aside/action.dart';
import '../../components/templateList/state.dart';

Effect<LibraryTabState> buildEffect() {
  return combineEffects(<Object, Effect<LibraryTabState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
    LibraryTabActionEnum.onLoadTemplate: _loadTemplate,
    AsideActionEnum.onChange: _asideChange
  });
}

bool _init(Action action, Context<LibraryTabState> ctx) {
  print('recommendTab effect init');
  ctx.dispatch(LibraryTabActionCreator.init());

  attributesModel().select({}).then((res) {
    List<dynamic> func = res.data['func'];
    func.insertAll(0, [
      {
        'id': 0,
        'name': '全部',
      },
      {
        'id': 0,
        'name': 'VIP',
      }
    ]);

    AttributesState attrState = AttributesState.fromJson(res.data);
    ctx.dispatch(LibraryTabActionCreator.updateFuncList(attrState.func));
  }).then((data) {
    ctx.dispatch(LibraryTabActionCreator.onLoadTemplate(params: {
      'page_size': ctx.state.templateList.pageState.size + 2000,
      'page_num': 1,
    }));
  });

  return true;
}

bool _dispose(Action action, Context<LibraryTabState> ctx) {
  print('recommendTab effect dispose');
  ctx.state.sController.dispose();
  ctx.state.asideSController.dispose();
  return true;
}

// 加载模板列表
Future _loadTemplate(Action action, Context<LibraryTabState> ctx) {
  final ActionPayload payload = action.payload;
  final Completer completer = payload?.completer;
  final Map<String, dynamic> params = Map.from(payload.data);

  final bool isReplace = params['page_num'] == 1;

  // 加载中
  ctx.dispatch(LibraryTabActionCreator.updateTemplateList(
      ctx.state.templateList.clone()..pageState.isLoading = true));

  return templatesModel()
      .select(params
        ..addAll({
          'ref_type': 1,
        }))
      .then((res) {
    final double uiWidth = Ui.get().sw(254.0);
    // 计算设计稿需要显示的宽高
    res.data.forEach((item) {
      int width = item['preview_info']['width'];
      int height = item['preview_info']['height'];
      item['preview_info']['showWidth'] = uiWidth;
      item['preview_info']['showHeight'] = uiWidth / width * height;
    });

    TemplateListState newTemplateList = TemplateListState.fromJson(res.data);

    if (!isReplace) {
      newTemplateList = ctx.state.templateList.clone()
        ..list.addAll(newTemplateList.list);
    }

    newTemplateList.pageState
      ..isLoading = false
      ..update(res);

    ctx.dispatch(LibraryTabActionCreator.updateTemplateList(newTemplateList));
    completer?.complete();
  }).catchError((e) {
    // 不让请求中断
    print('loadTemplates:');
    print(e);
    completer?.completeError(e);
  });
}

// 切换tab item
bool _asideChange(Action action, Context<LibraryTabState> ctx) {
  final Map<String, dynamic> params = {
    'page_num': 1,
    'page_size': ctx.state.templateList.pageState.size,
    'sale_mode': 1
  };

  if (action.payload == 1) {
    // VIP
    params['sale_mode'] = 2;
  } else if (action.payload > 1) {
    params.addAll({'func': ctx.state.funcList.list[action.payload].id});
  }

  ctx.dispatch(LibraryTabActionCreator.updateAsideIndex(action.payload));

  final Completer completer = Completer();
  ctx.dispatch(LibraryTabActionCreator.onLoadTemplate(
      params: params, completer: completer));
  completer.future.then((data) {
    // main回到顶部
    ctx.state.templateList.sController?.jumpTo(0);

    // aside滚动居中
    final RenderBox box = ctx.state.asideKey.currentContext.findRenderObject();

    // height: 54 marginBottom 48
    double offsetTop = (54.0 + 48.0) * action.payload.toDouble();
    offsetTop = Ui.get().sw(offsetTop + 48);

    ctx.state.asideSController.animateTo(
        offsetTop - box.size.height/2,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn
    );
  });

  return true;
}
