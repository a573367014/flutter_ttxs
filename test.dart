void main() {
  final b =  B();
  print(b.test);
}

class B extends A {
  B(): super();
}

class A {
  int test = 1;
  A({
    test
  });
}

