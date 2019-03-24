import 'package:fish_redux/fish_redux.dart';

class TemplateState implements Cloneable<TemplateState> {
  int materialId;
  String posterId;
  int templateType;
  int price;
  int picNumMax;
  PreviewInfoState previewInfo;
  int grade;
  int rulesCount;

  TemplateState(
      {this.materialId,
      this.posterId,
      this.templateType,
      this.price,
      this.picNumMax,
      this.previewInfo,
      this.grade,
      this.rulesCount});

  factory TemplateState.fromJson(Map<String, dynamic> json) {
    return TemplateState(
        materialId: json['material_id'],
        posterId: json['poster_id'],
        templateType: json['template_type'],
        price: json['price'],
        picNumMax: json['pic_num_max'],
        previewInfo: PreviewInfoState.fromJson(json['preview_info']),
        grade: json['grade'],
        rulesCount: json['rules_count']);
  }

  Map<String, dynamic> toJson() => {
        'material_id': materialId,
        'poster_id': posterId,
        'template_type': templateType,
        'price': price,
        'pic_num_max': picNumMax,
        'preview_info': previewInfo.toJson(),
        'grade': grade,
        'rules_count': rulesCount
      };

  @override
  TemplateState clone() {
    return TemplateState()
      ..materialId = materialId
      ..posterId = posterId
      ..templateType = templateType
      ..price = price
      ..picNumMax = picNumMax
      ..previewInfo = previewInfo
      ..grade = grade
      ..rulesCount = rulesCount;
  }
}

class PreviewInfoState implements Cloneable<PreviewInfoState> {
  int width;
  int height;
  double showWidth;
  double showHeight;
  String url;

  PreviewInfoState(
      {this.width, this.height, this.url, this.showHeight, this.showWidth});

  factory PreviewInfoState.fromJson(Map<String, dynamic> json) {
    return PreviewInfoState(
        width: json['width'],
        height: json['height'],
        url: json['url'],
        showHeight: json['showHeight'],
        showWidth: json['showWidth']);
  }

  Map<String, dynamic> toJson() =>
      {'width': width, 'height': height, 'url': url};

  @override
  PreviewInfoState clone() {
    return PreviewInfoState()
      ..width = width
      ..height = height
      ..url = url;
  }
}
