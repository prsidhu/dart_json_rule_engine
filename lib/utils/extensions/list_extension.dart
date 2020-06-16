import 'package:flutter/foundation.dart';

extension ListExtension on List {
  bool notEmpty() => this != null && this.isNotEmpty;

  bool equals(List b) => listEquals(this, b);

  bool greaterThan(List b) => this.length > b.length;

  bool lessThan(List b) => this.length < b.length;
}