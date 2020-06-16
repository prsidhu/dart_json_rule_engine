extension DoubleExtension on double {

  bool equals(num b) => this == b;

  bool contains(dynamic b) => false;

  bool greaterThan(num b) => this > b;

  bool lessThan(num b) => this < b;

  bool notEmpty() => this != null && this > 0.0;
}