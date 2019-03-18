import 'package:fish_redux/fish_redux.dart';

class TagState implements Cloneable<TagState> {
  String url;
  String name;
  String id;

  TagState({this.url, this.name, this.id});

  @override
  TagState clone() {
    return TagState()
      ..url = url
      ..name = name
      ..id = id;
  }
}
