import '../types/basic.dart';

class TagsJsonModel implements JsonModel<List<Map>> {
  final List<TagJsonModel> data;
  TagsJsonModel(this.data);

  static fromJson(List<Map> data) {
      List<TagJsonModel> newItems = data.map((json) => TagJsonModel.fromJson(json)).toList();
      return TagsJsonModel(newItems);
  }

  List<Map> toJson() => data.map((item) => item.toJson()).toList();
}

class TagJsonModel implements JsonModel<Map<String, dynamic>> {
  String keyword_id;
  String keyword;
  String img_url;
  String width;
  String height;
  String jump_url;

  TagJsonModel({
    this.keyword_id,
    this.keyword,
    this.img_url,
    this.width,
    this.height,
    this.jump_url,
  });

  static TagJsonModel fromJson(Map<String, dynamic> json) {
    return TagJsonModel(
      keyword_id: json['keyword_id'],
      keyword: json['keyword'],
      img_url: json['img_url'],
      width: json['width'],
      height: json['height'],
      jump_url: json['jump_url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'keyword_id': keyword_id,
        'keyword': keyword,
        'img_url': img_url,
        'width': width,
        'height': height,
        'jump_url': jump_url,
      };
}
