import 'dart:math';

void main() {
  final List<int> a = [1,2,3,4, 5, 6, 7];
  final b = chunk<int>(a, 2);
  print(a);
  print(b);
}

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

