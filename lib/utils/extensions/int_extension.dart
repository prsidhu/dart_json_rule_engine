extension IntExtension on int {
  bool greaterThan(int b) => this > b;

  bool equals(int b) => this == b;

  bool lessThan(int b) => this < b;

  bool notEmpty() => this != null && this > 0;

  bool contains(int b) => false;
}