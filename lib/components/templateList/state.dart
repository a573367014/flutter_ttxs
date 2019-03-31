import 'package:fish_redux/fish_redux.dart';
import '../template/state.dart';

class TemplateListState implements Cloneable<TemplateListState> {
  final List<TemplateState> list;
  TemplateListState(this.list);

  factory TemplateListState.fromJson(List<dynamic> parsedJson) {
    List<TemplateState> _list = List<TemplateState>();
    _list = parsedJson.map((json) => TemplateState.fromJson(json)).toList();
    return TemplateListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  TemplateListState clone() {
    return TemplateListState(List.from(list));
  }
}