import 'package:fish_redux/fish_redux.dart';

class AttributesState implements Cloneable<AttributesState> {
  ProfessionListState profession;
  IndustryListState industry;
  ScaleListState scale;
  MaskNumListState maskNum;
  ColorListState color;
  SaleModeListState saleMode;
  ShortcutListState shortcut;
  FuncListState func;
  DurationListState duration;

  AttributesState(
      {this.profession,
      this.industry,
      this.scale,
      this.maskNum,
      this.color,
      this.saleMode,
      this.shortcut,
      this.func,
      this.duration});

  factory AttributesState.fromJson(Map<String, dynamic> json) {
    return AttributesState(
        profession: ProfessionListState.fromJson(json['profession']),
        industry: IndustryListState.fromJson(json['industry']),
        scale: ScaleListState.fromJson(json['scale']),
        maskNum: MaskNumListState.fromJson(json['mask_num']),
        color: ColorListState.fromJson(json['color']),
        saleMode: SaleModeListState.fromJson(json['sale_mode']),
        shortcut: ShortcutListState.fromJson(json['shortcut']),
        func: FuncListState.fromJson(json['func']),
        duration: DurationListState.fromJson(json['duration']));
  }

  Map<String, dynamic> toJson() => {
        'profession': profession.toJson(),
        'industry': industry.toJson(),
        'scale': scale.toJson(),
        'mask_num': maskNum.toJson(),
        'color': color.toJson(),
        'sale_mode': saleMode.toJson(),
        'shortcut': shortcut.toJson(),
        'func': func.toJson(),
        'duration': duration.toJson()
      };

  @override
  AttributesState clone() {
    return AttributesState()
      ..profession = profession
      ..industry = industry
      ..scale = scale
      ..maskNum = maskNum
      ..color = color
      ..saleMode = saleMode
      ..shortcut = shortcut
      ..func = func
      ..duration = duration;
  }
}

class ProfessionListState implements Cloneable<ProfessionListState> {
  final List<ProfessionState> list;
  ProfessionListState(this.list);

  factory ProfessionListState.fromJson(List<dynamic> parsedJson) {
    List<ProfessionState> _list = List<ProfessionState>();
    _list = parsedJson.map((json) => ProfessionState.fromJson(json)).toList();
    return ProfessionListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  ProfessionListState clone() {
    return ProfessionListState(list);
  }
}

class ProfessionState implements Cloneable<ProfessionState> {
  int id;
  String name;
  int priority;

  ProfessionState({this.id, this.name, this.priority});

  factory ProfessionState.fromJson(Map<String, dynamic> json) {
    return ProfessionState(
        id: json['id'], name: json['name'], priority: json['priority']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'priority': priority};

  @override
  ProfessionState clone() {
    return ProfessionState()
      ..id = id
      ..name = name
      ..priority = priority;
  }
}

class IndustryListState implements Cloneable<IndustryListState> {
  final List<IndustryState> list;
  IndustryListState(this.list);

  factory IndustryListState.fromJson(List<dynamic> parsedJson) {
    List<IndustryState> _list = List<IndustryState>();
    _list = parsedJson.map((json) => IndustryState.fromJson(json)).toList();
    return IndustryListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  IndustryListState clone() {
    return IndustryListState(list);
  }
}

class IndustryState implements Cloneable<IndustryState> {
  int id;
  String name;
  int priority;
  IconsState icons;

  IndustryState({this.id, this.name, this.priority, this.icons});

  factory IndustryState.fromJson(Map<String, dynamic> json) {
    return IndustryState(
        id: json['id'],
        name: json['name'],
        priority: json['priority'],
        icons: IconsState.fromJson(json['icons']));
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'priority': priority, 'icons': icons.toJson()};

  @override
  IndustryState clone() {
    return IndustryState()
      ..id = id
      ..name = name
      ..priority = priority
      ..icons = icons;
  }
}

class ScaleListState implements Cloneable<ScaleListState> {
  final List<ScaleState> list;
  ScaleListState(this.list);

  factory ScaleListState.fromJson(List<dynamic> parsedJson) {
    List<ScaleState> _list = List<ScaleState>();
    _list = parsedJson.map((json) => ScaleState.fromJson(json)).toList();
    return ScaleListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  ScaleListState clone() {
    return ScaleListState(list);
  }
}

class ScaleState implements Cloneable<ScaleState> {
  int id;
  String name;
  String priority;

  ScaleState({this.id, this.name, this.priority});

  factory ScaleState.fromJson(Map<String, dynamic> json) {
    return ScaleState(
        id: json['id'], name: json['name'], priority: json['priority']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'priority': priority};

  @override
  ScaleState clone() {
    return ScaleState()
      ..id = id
      ..name = name
      ..priority = priority;
  }
}

class MaskNumListState implements Cloneable<MaskNumListState> {
  final List<MaskNumState> list;
  MaskNumListState(this.list);

  factory MaskNumListState.fromJson(List<dynamic> parsedJson) {
    List<MaskNumState> _list = List<MaskNumState>();
    _list = parsedJson.map((json) => MaskNumState.fromJson(json)).toList();
    return MaskNumListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  MaskNumListState clone() {
    return MaskNumListState(list);
  }
}

class MaskNumState implements Cloneable<MaskNumState> {
  int id;
  String name;
  int num;
  int priority;

  MaskNumState({this.id, this.name, this.num, this.priority});

  factory MaskNumState.fromJson(Map<String, dynamic> json) {
    return MaskNumState(
        id: json['id'],
        name: json['name'],
        num: json['num'],
        priority: json['priority']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'num': num, 'priority': priority};

  @override
  MaskNumState clone() {
    return MaskNumState()
      ..id = id
      ..name = name
      ..num = num
      ..priority = priority;
  }
}

class ColorListState implements Cloneable<ColorListState> {
  final List<ColorState> list;
  ColorListState(this.list);

  factory ColorListState.fromJson(List<dynamic> parsedJson) {
    List<ColorState> _list = List<ColorState>();
    _list = parsedJson.map((json) => ColorState.fromJson(json)).toList();
    return ColorListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  ColorListState clone() {
    return ColorListState(list);
  }
}

class ColorState implements Cloneable<ColorState> {
  int id;
  String name;
  String priority;
  String value;

  ColorState({this.id, this.name, this.priority, this.value});

  factory ColorState.fromJson(Map<String, dynamic> json) {
    return ColorState(
        id: json['id'],
        name: json['name'],
        priority: json['priority'],
        value: json['value']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'priority': priority, 'value': value};

  @override
  ColorState clone() {
    return ColorState()
      ..id = id
      ..name = name
      ..priority = priority
      ..value = value;
  }
}

class SaleModeListState implements Cloneable<SaleModeListState> {
  final List<SaleModeState> list;
  SaleModeListState(this.list);

  factory SaleModeListState.fromJson(List<dynamic> parsedJson) {
    List<SaleModeState> _list = List<SaleModeState>();
    _list = parsedJson.map((json) => SaleModeState.fromJson(json)).toList();
    return SaleModeListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  SaleModeListState clone() {
    return SaleModeListState(list);
  }
}

class SaleModeState implements Cloneable<SaleModeState> {
  int id;
  String name;
  int priority;

  SaleModeState({this.id, this.name, this.priority});

  factory SaleModeState.fromJson(Map<String, dynamic> json) {
    return SaleModeState(
        id: json['id'], name: json['name'], priority: json['priority']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'priority': priority};

  @override
  SaleModeState clone() {
    return SaleModeState()
      ..id = id
      ..name = name
      ..priority = priority;
  }
}

class ShortcutListState implements Cloneable<ShortcutListState> {
  final List<ShortcutState> list;
  ShortcutListState(this.list);

  factory ShortcutListState.fromJson(List<dynamic> parsedJson) {
    List<ShortcutState> _list = List<ShortcutState>();
    _list = parsedJson.map((json) => ShortcutState.fromJson(json)).toList();
    return ShortcutListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  ShortcutListState clone() {
    return ShortcutListState(list);
  }
}

class ShortcutState implements Cloneable<ShortcutState> {
  int id;
  String name;
  int priority;
  IconsState icons;

  ShortcutState({this.id, this.name, this.priority, this.icons});

  factory ShortcutState.fromJson(Map<String, dynamic> json) {
    return ShortcutState(
        id: json['id'],
        name: json['name'],
        priority: json['priority'],
        icons: IconsState.fromJson(json['icons']));
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'priority': priority, 'icons': icons.toJson()};

  @override
  ShortcutState clone() {
    return ShortcutState()
      ..id = id
      ..name = name
      ..priority = priority
      ..icons = icons;
  }
}

class IconsState implements Cloneable<IconsState> {
  String normal;

  IconsState({this.normal});

  factory IconsState.fromJson(Map<String, dynamic> json) {
    return IconsState(normal: json['normal']);
  }

  Map<String, dynamic> toJson() => {'normal': normal};

  @override
  IconsState clone() {
    return IconsState()..normal = normal;
  }
}

class FuncListState implements Cloneable<FuncListState> {
  final List<FuncState> list;
  FuncListState(this.list);

  factory FuncListState.fromJson(List<dynamic> parsedJson) {
    List<FuncState> _list = List<FuncState>();
    _list = parsedJson.map((json) => FuncState.fromJson(json)).toList();
    return FuncListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  FuncListState clone() {
    return FuncListState(list);
  }
}

class FuncState implements Cloneable<FuncState> {
  int id;
  String name;
  String priority;

  FuncState({this.id, this.name, this.priority});

  factory FuncState.fromJson(Map<String, dynamic> json) {
    return FuncState(
        id: json['id'], name: json['name'], priority: json['priority']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'priority': priority};

  @override
  FuncState clone() {
    return FuncState()
      ..id = id
      ..name = name
      ..priority = priority;
  }
}

class DurationListState implements Cloneable<DurationListState> {
  final List<DurationState> list;
  DurationListState(this.list);

  factory DurationListState.fromJson(List<dynamic> parsedJson) {
    List<DurationState> _list = List<DurationState>();
    _list = parsedJson.map((json) => DurationState.fromJson(json)).toList();
    return DurationListState(_list);
  }

  List<dynamic> toJson() => list.map((item) => item.toJson()).toList();

  @override
  DurationListState clone() {
    return DurationListState(list);
  }
}

class DurationState implements Cloneable<DurationState> {
  int id;
  String name;
  int num;

  DurationState({this.id, this.name, this.num});

  factory DurationState.fromJson(Map<String, dynamic> json) {
    return DurationState(id: json['id'], name: json['name'], num: json['num']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'num': num};

  @override
  DurationState clone() {
    return DurationState()
      ..id = id
      ..name = name
      ..num = num;
  }
}
