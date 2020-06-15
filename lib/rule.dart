import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'utils/validations.dart';

const errorPrefix = 'Failed to parse rule: invalid ';

class Rule {
  String key;
  String operand;
  String value;

  Rule({
    @required this.key,
    @required this.operand,
    @required this.value
  });

  factory Rule.fromJson(Map<String, dynamic> map) =>
    Rule(
      key: validateKey('key', map) ? map['key'] : throw Error.safeToString('$errorPrefix key'),
      value: validateKey('value', map)  ? map['value'] : throw Error.safeToString('$errorPrefix value'),
      operand: validateKey('operator', map) ? map['operator'] : throw Error.safeToString('$errorPrefix operand')
    );

  factory Rule.fromRawJson(String str) => Rule.fromJson(jsonDecode(str));
}