import 'package:fish_redux/fish_redux.dart';

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
    return TemplateListState(list);
  }
}

class TemplateState implements Cloneable<TemplateState> {
  int materialId;
  String posterId;
  int templateType;
  int scale;
  int credit;
  int price;
  int picNumMax;
  int templateModified;
  String preview;
  PreviewInfoState previewInfo;
  int grade;
  int rulesCount;
  String materialIdDisplayed;
  int type;
  int modifiedAt;
  int refType;
  String promoIconUrl;
  int hasBuy;

  TemplateState(
      {this.materialId,
      this.posterId,
      this.templateType,
      this.scale,
      this.credit,
      this.price,
      this.picNumMax,
      this.templateModified,
      this.preview,
      this.previewInfo,
      this.grade,
      this.rulesCount,
      this.materialIdDisplayed,
      this.type,
      this.modifiedAt,
      this.refType,
      this.promoIconUrl,
      this.hasBuy});

  factory TemplateState.fromJson(Map<String, dynamic> json) {
    return TemplateState(
        materialId: json['material_id'],
        posterId: json['poster_id'],
        templateType: json['template_type'],
        scale: json['scale'],
        credit: json['credit'],
        price: json['price'],
        picNumMax: json['pic_num_max'],
        templateModified: json['template_modified'],
        preview: json['preview'],
        previewInfo: PreviewInfoState.fromJson(json['preview_info']),
        grade: json['grade'],
        rulesCount: json['rules_count'],
        materialIdDisplayed: json['material_id_displayed'],
        type: json['type'],
        modifiedAt: json['modified_at'],
        refType: json['ref_type'],
        promoIconUrl: json['promo_icon_url'],
        hasBuy: json['has_buy']);
  }

  Map<String, dynamic> toJson() => {
        'material_id': materialId,
        'poster_id': posterId,
        'template_type': templateType,
        'scale': scale,
        'credit': credit,
        'price': price,
        'pic_num_max': picNumMax,
        'template_modified': templateModified,
        'preview': preview,
        'preview_info': previewInfo.toJson(),
        'grade': grade,
        'rules_count': rulesCount,
        'material_id_displayed': materialIdDisplayed,
        'type': type,
        'modified_at': modifiedAt,
        'ref_type': refType,
        'promo_icon_url': promoIconUrl,
        'has_buy': hasBuy
      };

  @override
  TemplateState clone() {
    return TemplateState()
      ..materialId = materialId
      ..posterId = posterId
      ..templateType = templateType
      ..scale = scale
      ..credit = credit
      ..price = price
      ..picNumMax = picNumMax
      ..templateModified = templateModified
      ..preview = preview
      ..previewInfo = previewInfo
      ..grade = grade
      ..rulesCount = rulesCount
      ..materialIdDisplayed = materialIdDisplayed
      ..type = type
      ..modifiedAt = modifiedAt
      ..refType = refType
      ..promoIconUrl = promoIconUrl
      ..hasBuy = hasBuy;
  }
}

class PreviewInfoState implements Cloneable<PreviewInfoState> {
  int width;
  int height;
  String url;
  String type;

  PreviewInfoState({this.width, this.height, this.url, this.type});

  factory PreviewInfoState.fromJson(Map<String, dynamic> json) {
    return PreviewInfoState(
        width: json['width'],
        height: json['height'],
        url: json['url'],
        type: json['type']);
  }

  Map<String, dynamic> toJson() =>
      {'width': width, 'height': height, 'url': url, 'type': type};

  @override
  PreviewInfoState clone() {
    return PreviewInfoState()
      ..width = width
      ..height = height
      ..url = url
      ..type = type;
  }
}
