import 'package:flutter_test/flutter_test.dart';

import 'package:dart_json_rule_engine/dart_json_rule_engine.dart';

void main() {
  test('parsing criteria', () {
    RuleEngine engine = RuleEngine();
    Map<String, dynamic> facts = {
      'captain': 'hendo',
      'leader': 'stevie'
    };

    Map<String, dynamic> rules = {
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
      ],
      'any': [
        {
          'key': 'leader',
          'operator': 'in',
          'value': 'stevie gerrad'
        }
      ]
    };

    Map<String, dynamic> condition = {
      'rule': rules,
      'event': {
        'name': 'huzzah!'
      }
    };
    engine.addCondition(condition);
    expect(engine.run(facts), true);
  });
}