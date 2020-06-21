import 'package:flutter_test/flutter_test.dart';

import 'package:dart_json_rule_engine/dart_json_rule_engine.dart';

void main() {
  test('basic test', () {
    Map<String, dynamic> fact_1 = {
      'forward': 'Messi',
      'goals': 23,
      'club': 'Barcelona'
    };

    Map<String, dynamic> fact_2 = {
      'forward': 'Neymar',
      'goals': 18,
      'club': 'PSG'
    };

    Map<String, dynamic> condition = {
      'rule': {
        'all': [
          {
            'key': 'forward',
            'operator': 'in',
            'value': ['Messi', 'Ronaldo', 'Neymar']
          },
          {
            'any': [
              {'key': 'club', 'operator': 'equals', 'value': 'Liverpool'},
              {'key': 'goals', 'operator': 'greaterthan', 'value': 20}
            ]
          }
        ]
      }
    };
    RuleEngine engine = RuleEngine();
    engine.addCondition(condition);
    expect(engine.run(fact_1), true); // true
    expect(engine.run(fact_2), false); // false
  });

  test('Should return false for empty facts', () {
    RuleEngine engine = RuleEngine();
    Map<String, dynamic> facts = {'captain': 'hendo', 'leader': 'stevie'};

    Map<String, dynamic> rules = {
      'all': [
        {'key': 'captain', 'operator': 'equals', 'value': 'hendo'},
        {'key': 'leader', 'operator': 'equals', 'value': 'stevie'}
      ],
      'any': [
        {'key': 'leader', 'operator': 'in', 'value': 'stevie gerrad'}
      ]
    };

    Map<String, dynamic> condition = {
      'rule': rules,
      'event': {'name': 'huzzah!'}
    };
    engine.addCondition(condition);
    expect(engine.run({}), false);
  });

  test('Should return true for empty rules', () {
    RuleEngine engine = RuleEngine();
    Map<String, dynamic> facts = {'captain': 'hendo', 'leader': 'stevie'};
    Map<String, dynamic> condition = {'rule': {}};
    engine.addCondition(condition);
    expect(engine.run(facts), true);
  });

  test('Should return false for failure', () {
    RuleEngine engine = RuleEngine();
    Map<String, dynamic> facts = {'captain': 'hendo', 'leader': 'stevie'};

    Map<String, dynamic> rules = {
      'all': [
        {'key': 'captain', 'operator': 'equals', 'value': 'hend'},
        {'key': 'leader', 'operator': 'equals', 'value': 'stevie'}
      ],
      'any': [
        {
          'all': [
            {'key': 'leader', 'operator': 'in', 'value': 'stevie G'}
          ]
        },
        {'key': 'leader', 'operator': 'in', 'value': 'stevie G'}
      ]
    };

    Map<String, dynamic> condition = {
      'rule': rules,
      'event': {'name': 'huzzah!'}
    };
    engine.addCondition(condition);
    expect(engine.run(facts), false);
  });
}
