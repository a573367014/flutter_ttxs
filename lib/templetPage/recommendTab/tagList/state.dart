
import 'package:fish_redux/fish_redux.dart';

class KeywordListState implements Cloneable<KeywordListState> {
  final List<KeywordState> list;
  KeywordListState(this.list);

  factory KeywordListState.fromJson(
      List<dynamic> parsedJson) {
    List<KeywordState> _list = List<KeywordState>();
    _list = parsedJson.map((json) => KeywordState.fromJson(json)).toList();
    return KeywordListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  KeywordListState clone() {
    return KeywordListState(list);
  }
}

class KeywordState implements Cloneable<KeywordState> {
  int keywordId;
  String keyword;
  StyleInfoState styleInfo;
  String jumpUrl;

  KeywordState({this.keywordId, this.keyword, this.styleInfo, this.jumpUrl});

  factory KeywordState.fromJson(Map<String, dynamic> json) {
    return KeywordState(
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
  KeywordState clone() {
    return KeywordState()
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
