import 'package:flutter_test/flutter_test.dart';

import 'package:dart_json_rule_engine/dart_json_rule_engine.dart';

void main() {
  // test('Should return false for empty facts', () {
  //   RuleEngine engine = RuleEngine();
  //   Map<String, dynamic> facts = {
  //     'captain': 'hendo',
  //     'leader': 'stevie'
  //   };

  //   Map<String, dynamic> rules = {
  //     'all': [
  //       {
  //         'key': 'captain',
  //         'operator': 'equals',
  //         'value': 'hendo'
  //       },
  //       {
  //         'key': 'leader',
  //         'operator': 'equals',
  //         'value': 'stevie'
  //       }
  //     ],
  //     'any': [
  //       {
  //         'key': 'leader',
  //         'operator': 'in',
  //         'value': 'stevie gerrad'
  //       }
  //     ]
  //   };

  //   Map<String, dynamic> condition = {
  //     'rule': rules,
  //     'event': {
  //       'name': 'huzzah!'
  //     }
  //   };
  //   engine.addCondition(condition);
  //   expect(engine.run({}), false);
  // });

  // test('Should return true for empty rules', () {
  //   RuleEngine engine = RuleEngine();
  //   Map<String, dynamic> facts = {
  //     'captain': 'hendo',
  //     'leader': 'stevie'
  //   };
  //   Map<String, dynamic> condition = {
  //     'rule': {}
  //   };
  //   engine.addCondition(condition);
  //   expect(engine.run(facts), true);
  // });

  test('Should return false for failure', () {
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
          'value': 'stevi'
        }
      ],
      'any': [
        {
          'all': [
            {
              'key': 'leader',
              'operator': 'in',
              'value': 'stevie G'
            }
          ]
        },
        {
          'key': 'leader',
          'operator': 'in',
          'value': 'stevie G'
        }
      ]
    };

    Map<String, dynamic> rules2 = {
      'rule': {
          'key': 'leader',
          'operator': 'in',
          'value': 'stevie G'
        }
    };

    Map<String, dynamic> condition = {
      'rule': rules,
      'event': {
        'name': 'huzzah!'
      }
    };
    engine.addCondition(condition);
    expect(engine.run(facts), false);
  });
}