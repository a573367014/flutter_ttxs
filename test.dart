import 'dart:async';

void main() {
  final a = {};
  final b = null;
  if(a.containsKey('b')) {
  }
  print(b ?? b['a']);

//  Completer completer =  a['completer'];
//  print(completer);
//  print(completer?.future);
}
