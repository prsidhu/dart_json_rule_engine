import 'package:flutter_test/flutter_test.dart';

import 'package:dart_json_rule_engine/dart_json_rule_engine.dart';

void main() {
  test('performs EQUALS operation', () {
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
