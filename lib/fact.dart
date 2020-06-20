import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'utils/validations.dart';

class Fact {
  final String key;
  final String value;

  Fact({
    @required this.key,
    @required this.value
  });

  factory Fact.fomJson(Map<String, dynamic> map) =>
    Fact(
      key: validateKey('key', map) ? map['key'] : throw Error.safeToString('Failed to parse fact: invalid key'),
      value: validateKey('value', map) ? map['value'] : null
    );

  factory Fact.fromRawJson(String str) => Fact.fomJson(jsonDecode(str));
}