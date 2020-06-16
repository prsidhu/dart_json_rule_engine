extension NumExtension on num {
  bool equals(num b) => this == b;

  bool contains(num b) => false;

  bool greaterThan(num b) => this > b;

  bool lessThan(num b) => this < b;

  bool notEmpty() => this != null && this > 0;
}