import 'dart:convert';

import 'package:dart_json_rule_engine/utils/decoder.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dart_json_rule_engine/dart_json_rule_engine.dart';

void main() {


  test('Check for precense of element in list, map, and string', () {
    RuleEngine engine = RuleEngine();
    Map<String, dynamic> fact = {
      "key": "salah",
      "goals": 8
    };

    List<Map<String, dynamic>> conditions = [
      {
        "rule": {
          "key": "key",
          "operator": "in",
          "value": '["salah"]'
        },
        "event": {
          "name": "scorer"
        }
      },
      {
        "rule": {
          "key": "key",
          "operator": "in",
          "value": '{"salah":"value"}'
        },
        "event": {
          "name": "talisman"
        }
      },
      {
        "rule": {
          "key": "key",
          "operator": "in",
          "value": 'salah scores!'
        },
        "event": {
          "name": "talisman"
        }
      }
    ];
    engine.addCondition(conditions);
    expect(engine.run(fact), true);
  });

  test('test contains', () {
    RuleEngine engine = RuleEngine();
    Map<String, dynamic> fact = {
      "attackers": '["salah"]',
      "club": "liverpool fc",
      "league": {
        "title": "2020"
      }
    };

    List<Map<String, dynamic>> conditions = [
      {
        "rule": {
          "key": "attackers",
          "operator": "contains",
          "value": 'salah'
        },
        "event": {
          "name": "scorer"
        }
      },
      {
        "rule": {
          "key": "league",
          "operator": "contains",
          "value": 'title'
        },
        "event": {
          "name": "talisman"
        }
      },
      {
        "rule": {
          "key": "club",
          "operator": "contains",
          "value": 'league'
        },
        "event": {
          "name": "talisman"
        }
      }
    ];
    engine.addCondition(conditions);
    expect(engine.run(fact), true);
  });

  test('greater than', () {
    RuleEngine engine = RuleEngine();
    Map<String, dynamic> fact = {
      "attackers": ["salah", "mane"],
      "club": "liverpool fc",
      "league": {
        "title": "2020"
      },
      "ucl": 6
    };
    List<Map<String, dynamic>> conditions = [
      {
        "rule": {
          "key": "attackers",
          "operator": "greaterthan",
          "value": '["salah"]'
        },
        "event": {
          "name": "scorer"
        }
      },
      {
        "rule": {
          "key": "league",
          "operator": "greaterthan",
          "value": '{}'
        },
        "event": {
          "name": "talisman"
        }
      },
      {
        "rule": {
          "key": "club",
          "operator": "greaterthan",
          "value": 'fc'
        },
        "event": {
          "name": "talisman"
        }
      },
      {
        "rule": {
          "key": "ucl",
          "operator": "greaterthan",
          "value": '5'
        },
        "event": {
          "name": "talisman"
        }
      }
    ];
    engine.addCondition(conditions);
    expect(engine.run(fact), true);

  });

  test('not empty', () {
    RuleEngine engine = RuleEngine();
    Map<String, dynamic> fact = {
      "attackers": ["salah", "mane"],
      "club": "liverpool fc",
      "league": {
        "title": "2020"
      },
      "ucl": 6
    };
    List<Map<String, dynamic>> conditions = [
      {
        "rule": {
          "key": "attackers",
          "operator": "notempty",
          "value": '[]'
        },
        "event": {
          "name": "scorer"
        }
      },
      {
        "rule": {
          "key": "league",
          "operator": "notempty",
          "value": '{}'
        },
        "event": {
          "name": "talisman"
        }
      },
      {
        "rule": {
          "key": "club",
          "operator": "notempty",
          "value": ''
        },
        "event": {
          "name": "talisman"
        }
      },
      {
        "rule": {
          "key": "ucl",
          "operator": "notempty",
          "value": '8'
        },
        "event": {
          "name": "talisman"
        }
      }
    ];
    engine.addCondition(conditions);
    expect(engine.run(fact), true);
  });
}