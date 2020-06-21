import 'dart:convert';

import 'package:dart_json_rule_engine/utils/validations.dart';
import 'package:flutter/foundation.dart';

const defaultEvent = 'Unknown';

class Event {
  String name;

  Event({@required this.name});

  factory Event.fromJson(Map<String, dynamic> map) => Event(
      name: validateMap(map) && validateKey('name', map)
          ? map['name']
          : defaultEvent);

  factory Event.fromRawJson(String str) => Event.fromJson(jsonDecode(str));
}
