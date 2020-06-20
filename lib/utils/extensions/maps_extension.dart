import 'package:flutter/foundation.dart';

extension MapExtension on Map {
  bool contains(String key) => this.containsKey(key);

  bool notEmpty() => this != null && this.isNotEmpty;

  bool greaterThan(dynamic a) => false;

  bool lessThan(dynamic a) => false;

  bool equals(Map map) => mapEquals(this, map);
}