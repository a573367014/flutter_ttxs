class LabelListJsonModel {
  final List<LabelJsonModel> list;
  LabelListJsonModel(this.list);

  factory LabelListJsonModel.fromJson(List<Map> list) {
    List<LabelJsonModel> newItems =
        list.map((json) => LabelJsonModel.fromJson(json)).toList();
    return LabelListJsonModel(newItems);
  }

  List<Map> toJson() => list.map((item) => item.toJson()).toList();
}

class LabelJsonModel {
  double keyword_id;
  String keyword;
  StyleInfoJsonModel style_info;
  String jump_url;

  LabelJsonModel(
      {this.keyword_id, this.keyword, this.style_info, this.jump_url});

  factory LabelJsonModel.fromJson(Map<String, dynamic> json) {
    return LabelJsonModel(
        keyword_id: json['keyword_id'],
        keyword: json['keyword'],
        style_info: StyleInfoJsonModel.fromJson(json['style_info']),
        jump_url: json['jump_url']);
  }

  Map<String, dynamic> toJson() => {
        'keyword_id': keyword_id,
        'keyword': keyword,
        'style_info': style_info.toJson(),
        'jump_url': jump_url
      };
}

class StyleInfoJsonModel {
  String img_url;
  double width;
  double height;

  StyleInfoJsonModel({this.img_url, this.width, this.height});

  factory StyleInfoJsonModel.fromJson(Map<String, dynamic> json) {
    return StyleInfoJsonModel(
        img_url: json['img_url'], width: json['width'], height: json['height']);
  }

  Map<String, dynamic> toJson() =>
      {'img_url': img_url, 'width': width, 'height': height};
}
