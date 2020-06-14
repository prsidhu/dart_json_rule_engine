import 'dart:convert';

import 'package:dart_json_rule_engine/event.dart';
import 'package:dart_json_rule_engine/fact.dart';
import 'package:dart_json_rule_engine/rule.dart';
import 'package:dart_json_rule_engine/utils/validations.dart';
import 'package:flutter/foundation.dart';

const errorPrefix = 'Faile to parse';

class Condition {
  Rule rule;
  Event event;

  Condition({
    @required this.rule,
    @required this.event
  });

  factory Condition.fromJson(Map<String, dynamic> map) {
    if(!validateKey('rule', map) || !validateKey('event', map)) throw Error.safeToString('$errorPrefix condition');
    return Condition(
      event: Event.fromJson(map['event']),
      rule: Rule.fromJson(map['rule'])
    );
  }

  factory Condition.fromRawJson(String str) => Condition.fromJson(jsonDecode(str));
}