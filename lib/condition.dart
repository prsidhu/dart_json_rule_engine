import 'dart:convert';

import 'package:dart_json_rule_engine/event.dart';
import 'package:dart_json_rule_engine/fact.dart';
import 'package:dart_json_rule_engine/rule.dart';
import 'package:dart_json_rule_engine/utils/validations.dart';
import 'package:flutter/foundation.dart';

const errorPrefix = 'Faile to parse';

class Condition {
  dynamic rules;
  Event event;

  Condition({@required this.rules, @required this.event});

  factory Condition.fromJson(Map<String, dynamic> map) {
    try {
      if (!validateKey('rule', map) || !validateKey('event', map))
        throw Error.safeToString('$errorPrefix condition');
      return Condition(
          event: Event.fromJson(map['event']),
          rules: Condition.tryParse(map['rule']);
    } catch (e) {
      print(e);
      throw Error.safeToString('$errorPrefix condition');
    }
  }

  factory Condition.fromRawJson(String str) =>
      Condition.fromJson(jsonDecode(str));

  static dynamic tryParse(dynamic obj, [bool flag = true]) {
    try {
      if (obj != null) {
        if (obj is Map) {
          if (!obj.containsKey('all') && !obj.containsKey('any')) {
            Rule rule = Rule.tryParse(obj);
            if (rule == null) throw Error();
            return flag ? {'all': List()..add(rule)} : rule;
          } else {
            Map res = {};
            List keys = obj.keys.toList();
            keys.forEach((key) {
              res[key] = tryParse(obj[key], false);
            });
            return res;
          }
        } else if (obj is List) {
          List list = [];
          for (var item in obj) {
            list.add(tryParse(item, false));
          }
          return list;
        }
      } throw Error();
    } catch (e) {
      print(e);
      throw Error();
    }
  }
}
