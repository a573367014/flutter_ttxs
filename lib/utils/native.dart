import 'dart:math';

//  数组分块
List<List<T>> chunk<T>(List<T> list, int size) {
  final List<List<T>> result = [];
  int begin = 0;

  List((list.length / size).ceil()).forEach((i) {
    final int end =begin + size;
    result.add(list.sublist(begin, min(end, list.length)));
    begin += size;
  });
  return result;
}