class TemplateListJsonModel {
  final List<TemplateJsonModel> list;
  TemplateListJsonModel(this.list);

  factory TemplateListJsonModel.fromJson(List<Map> list) {
    List<TemplateJsonModel> newItems =
        list.map((json) => TemplateJsonModel.fromJson(json)).toList();
    return TemplateListJsonModel(newItems);
  }

  List<Map> toJson() => list.map((item) => item.toJson()).toList();
}

class TemplateJsonModel {
  double material_id;
  String poster_id;
  double template_type;
  double scale;
  double credit;
  double price;
  double pic_num_max;
  double template_modified;
  String preview;
  PreviewInfoJsonModel preview_info;
  double grade;
  double rules_count;
  String material_id_displayed;
  double type;
  double modified_at;
  double ref_type;
  String promo_icon_url;
  double has_buy;

  TemplateJsonModel(
      {this.material_id,
      this.poster_id,
      this.template_type,
      this.scale,
      this.credit,
      this.price,
      this.pic_num_max,
      this.template_modified,
      this.preview,
      this.preview_info,
      this.grade,
      this.rules_count,
      this.material_id_displayed,
      this.type,
      this.modified_at,
      this.ref_type,
      this.promo_icon_url,
      this.has_buy});

  factory TemplateJsonModel.fromJson(Map<String, dynamic> json) {
    return TemplateJsonModel(
        material_id: json['material_id'],
        poster_id: json['poster_id'],
        template_type: json['template_type'],
        scale: json['scale'],
        credit: json['credit'],
        price: json['price'],
        pic_num_max: json['pic_num_max'],
        template_modified: json['template_modified'],
        preview: json['preview'],
        preview_info: PreviewInfoJsonModel.fromJson(json['preview_info']),
        grade: json['grade'],
        rules_count: json['rules_count'],
        material_id_displayed: json['material_id_displayed'],
        type: json['type'],
        modified_at: json['modified_at'],
        ref_type: json['ref_type'],
        promo_icon_url: json['promo_icon_url'],
        has_buy: json['has_buy']);
  }

  Map<String, dynamic> toJson() => {
        'material_id': material_id,
        'poster_id': poster_id,
        'template_type': template_type,
        'scale': scale,
        'credit': credit,
        'price': price,
        'pic_num_max': pic_num_max,
        'template_modified': template_modified,
        'preview': preview,
        'preview_info': preview_info.toJson(),
        'grade': grade,
        'rules_count': rules_count,
        'material_id_displayed': material_id_displayed,
        'type': type,
        'modified_at': modified_at,
        'ref_type': ref_type,
        'promo_icon_url': promo_icon_url,
        'has_buy': has_buy
      };
}

class PreviewInfoJsonModel {
  double width;
  double height;
  String url;
  String type;

  PreviewInfoJsonModel({this.width, this.height, this.url, this.type});

  factory PreviewInfoJsonModel.fromJson(Map<String, dynamic> json) {
    return PreviewInfoJsonModel(
        width: json['width'],
        height: json['height'],
        url: json['url'],
        type: json['type']);
  }

  Map<String, dynamic> toJson() =>
      {'width': width, 'height': height, 'url': url, 'type': type};
}
