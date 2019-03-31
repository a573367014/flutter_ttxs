import 'package:fish_redux/fish_redux.dart';
import 'dart:async';
import '../../components/templateList/state.dart';
import '../../types/basic.dart';

enum LibraryTabActionEnum {
  updateTemplateList,
  updatePageState,
  onLoadTemplate,
  onLoadData
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
    bool replace = false,
    Completer completer
  }) {
    return Action(LibraryTabActionEnum.onLoadTemplate,
        payload: ActionPayload(data: replace, completer: completer));
  }
}
