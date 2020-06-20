import 'package:flutter_test/flutter_test.dart';

import 'package:dart_json_rule_engine/dart_json_rule_engine.dart';

void main() {

  test('Game 02: perform NOTEMPTY operation', () {
    final engine = RuleEngine();
    Map<String, dynamic> fact_1 = {
      "version": "okay"
    };
    Map<String, dynamic> condition = {
      "rule": {
        "key": "version",
        "operator": "NOTEMPTY",
        "value": "0"
      }
    };
    engine.addCondition(condition);
    expect(engine.run(fact_1), true);
  });

  test('Game 02: perform GREATERTHAN operation', () {
    final engine = RuleEngine();
    Map<String, dynamic> fact_1 = {
      "version": "2"
    };
    Map<String, dynamic> condition = {
      "rule": {
        "key": "version",
        "operator": "greaterthan",
        "value": "0"
      },
      "event": {
        "name": "match"
      }
    };
    engine.addCondition(condition);
    expect(engine.run(fact_1), true);
  });

  test('Game 02: perform LESSTHAN operation', () {
    final engine = RuleEngine();
    Map<String, dynamic> fact_1 = {
      "version": "2"
    };
    Map<String, dynamic> condition = {
      "rule": {
        "key": "version",
        "operator": "lessthan",
        "value": "20"
      },
      "event": {
        "name": "match"
      }
    };
    engine.addCondition(condition);
    expect(engine.run(fact_1), true);
  });

  test('Game 01: performs EQUALS operation', () {
    final engine = RuleEngine();
    Map<String, dynamic> fact_1 = {
      "version": "20"
    };
    Map<String, dynamic> fact_2 = {
      "version": "2"
    };
    Map<String, dynamic> condition = {
      "rule": {
        "key": "version",
        "operator": "equals",
        "value": "20"
      },
      "event": {
        "name": "match"
      }
    };
    engine.addCondition(condition);
    expect(engine.run(fact_1), true);
    expect(engine.run(fact_2), false);
  });
}
