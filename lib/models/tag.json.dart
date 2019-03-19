class TagListJsonModel {
  final List<TagJsonModel> list;
  TagListJsonModel(this.list);

  factory TagListJsonModel.fromJson(List<Map> list) {
    List<TagJsonModel> newItems =
        list.map((json) => TagJsonModel.fromJson(json)).toList();
    return TagListJsonModel(newItems);
  }

  List<Map> toJson() => list.map((item) => item.toJson()).toList();
}

class TagJsonModel {
  double keyword_id;
  String keyword;
  StyleInfoJsonModel style_info;
  String jump_url;

  TagJsonModel({this.keyword_id, this.keyword, this.style_info, this.jump_url});

  factory TagJsonModel.fromJson(Map<String, dynamic> json) {
    return TagJsonModel(
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
