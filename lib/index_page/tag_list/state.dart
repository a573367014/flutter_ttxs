import 'package:fish_redux/fish_redux.dart';

class TagListState implements Cloneable<TagListState> {
  final List<TagState> list;
  TagListState(this.list);

  factory TagListState.fromJson(
      List<dynamic> parsedJson) {
    List<TagState> _list = List<TagState>();
    _list = parsedJson.map((json) => TagState.fromJson(json)).toList();
    return TagListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  TagListState clone() {
    return TagListState(list);
  }
}

class TagState implements Cloneable<TagState> {
  int keywordId;
  String keyword;
  StyleInfoState styleInfo;
  String jumpUrl;

  TagState({this.keywordId, this.keyword, this.styleInfo, this.jumpUrl});

  factory TagState.fromJson(Map<String, dynamic> json) {
    return TagState(
        keywordId: json['keyword_id'],
        keyword: json['keyword'],
        styleInfo: StyleInfoState.fromJson(json['style_info']),
        jumpUrl: json['jump_url']);
  }

  Map<String, dynamic> toJson() => {
        'keyword_id': keywordId,
        'keyword': keyword,
        'style_info': styleInfo.toJson(),
        'jump_url': jumpUrl
      };

  @override
  TagState clone() {
    return TagState()
      ..keywordId = keywordId
      ..keyword = keyword
      ..styleInfo = styleInfo
      ..jumpUrl = jumpUrl;
  }
}

class StyleInfoState implements Cloneable<StyleInfoState> {
  String imgUrl;
  int width;
  int height;

  StyleInfoState({this.imgUrl, this.width, this.height});

  factory StyleInfoState.fromJson(Map<String, dynamic> json) {
    return StyleInfoState(
        imgUrl: json['img_url'], width: json['width'], height: json['height']);
  }

  Map<String, dynamic> toJson() =>
      {'img_url': imgUrl, 'width': width, 'height': height};

  @override
  StyleInfoState clone() {
    return StyleInfoState()
      ..imgUrl = imgUrl
      ..width = width
      ..height = height;
  }
}
