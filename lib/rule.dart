import 'dart:convert';

import 'package:dart_json_rule_engine/utils/decoder.dart';
import 'package:flutter/foundation.dart';

import 'utils/validations.dart';

const errorPrefix = 'Failed to parse rule: invalid ';

class Rule {
  String key;
  String operand;
  dynamic value;

  Rule({
    @required this.key,
    @required this.operand,
    @required this.value
  });

  factory Rule.fromJson(Map<String, dynamic> map) =>
    Rule(
      key: validateKey('key', map) ? map['key'] : throw Error.safeToString('$errorPrefix key'),
      value: validateKey('value', map)  ? decode(map['value']) : throw Error.safeToString('$errorPrefix value'),
      operand: validateKey('operator', map) ? map['operator'] : throw Error.safeToString('$errorPrefix operand')
    );

  factory Rule.fromRawJson(String str) => Rule.fromJson(jsonDecode(str));

  factory Rule.tryParse(Map<String, dynamic> map) {
    try {
      if(validateMap(map)) {
        if(!validateString(map['key']) || !validateString(map['value'].toString()) || !validateString(map['operator'])) throw Error();
        return Rule(
          key: map['key'],
          operand: map['operator'],
          value: decode(map['value'])
        );
      } else throw Error();
    } catch(e) {
      return null;
    }
  }

  @override
  String toString() => {
    'key': key,
    'operator': operand,
    'value': value
  }.toString();
}