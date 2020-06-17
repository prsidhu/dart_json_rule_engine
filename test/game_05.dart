import 'package:flutter_test/flutter_test.dart';

import 'package:dart_json_rule_engine/dart_json_rule_engine.dart';

void main() {
  test('parsing criteria', () {
    RuleEngine engine = RuleEngine();
    Map<String, dynamic> facts = {
      'captain': 'hendo',
      'leader': 'stevie'
    };

    Map<String, dynamic> condition = {
      'all': [
        {
          'key': 'captain',
          'operator': 'equals',
          'value': 'hendo'
        },
        {
          'key': 'leader',
          'operator': 'equals',
          'value': 'stevie'
        }
      ]
    };
    engine.parseCriteria(condition);
  });
}