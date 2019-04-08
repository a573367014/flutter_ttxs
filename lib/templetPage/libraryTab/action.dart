import 'package:fish_redux/fish_redux.dart';
import 'dart:async';
import '../../models/attributes.json.dart';
import '../../components/templateList/state.dart';
import '../../types/basic.dart';

enum LibraryTabActionEnum {
  updateTemplateList,
  updatePageState,
  onLoadTemplate,
  onLoadData,
  updateFuncList,
  updateAsideIndex
}

class LibraryTabActionCreator {
  static Action updateTemplateList(TemplateListState listState) {
    return Action(LibraryTabActionEnum.updateTemplateList, payload: listState);
  }

  static Action updatePageState(PageState pageState) {
    return Action(LibraryTabActionEnum.updatePageState, payload: pageState);
  }

  static Action onLoadData({
    Completer completer
  }) {
    return Action(LibraryTabActionEnum.onLoadData,
        payload:ActionPayload(completer: completer));
  }

  static Action onLoadTemplate({
    Map<String, dynamic> params,
    Completer completer
  }) {
    return Action(LibraryTabActionEnum.onLoadTemplate,
        payload: ActionPayload(data: params, completer: completer));
  }

  static Action updateFuncList(FuncListState funcList) {
    return Action(LibraryTabActionEnum.updateFuncList,
        payload: funcList);
  }

  static Action updateAsideIndex(int index) {
    return Action(LibraryTabActionEnum.updateAsideIndex,
        payload: index);
  }
}
