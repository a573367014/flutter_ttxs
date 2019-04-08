import 'dart:math';

void main() {
  final Map<String, dynamic> a = {
    'page_size': 1,
    'page_num': 3,
    'ref_type': 1,
  };
  print(Map.from(a)..addAll({
    'v': 3
  }));
}
