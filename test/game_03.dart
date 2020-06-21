import 'package:flutter_test/flutter_test.dart';

import 'package:dart_json_rule_engine/dart_json_rule_engine.dart';

void main() {

  ///
  ///  Following test cases ahve been commented out as they were built to test older code version.
  ///

  // test('Multiple conditions on a single fact', () {
  //   final engine = RuleEngine();

  //   Map<String, dynamic> fact = {
  //     'goals': 8
  //   };

  //   List<Map<String, dynamic>> conditions = [
  //     {
  //       "rule": {
  //         "key": "goals",
  //         "operator": "greaterthan",
  //         "value": "5"
  //       },
  //       "event": {
  //         "name": "scorer"
  //       }
  //     },
  //     {
  //       "rule": {
  //         "key": "goals",
  //         "operator": "lessthan",
  //         "value": "10"
  //       },
  //       "event": {
  //         "name": "not a leader"
  //       }
  //     }
  //   ];
  //   engine.addCondition(conditions);
  //   expect(engine.run(fact), true);
  // });

  // test('Multiple conditions on multiple facts', () {
  //   final engine = RuleEngine();

  //   Map<String, dynamic> fact = {
  //     'goals': 4,
  //     'wins': 9
  //   };

  //   List<Map<String, dynamic>> conditions = [
  //     {
  //       "rule": {
  //         "key": "goals",
  //         "operator": "greaterthan",
  //         "value": "5"
  //       },
  //       "event": {
  //         "name": "scorer"
  //       }
  //     },
  //     {
  //       "rule": {
  //         "key": "wins",
  //         "operator": "greaterthan",
  //         "value": "10"
  //       },
  //       "event": {
  //         "name": "talisman"
  //       }
  //     }
  //   ];
  //   engine.addCondition(conditions);
  //   expect(engine.run(fact), false);
  // });

  // test('Empty facts with conditions should fail', () {
  //   final engine = RuleEngine();

  //   Map<String, dynamic> fact = {};

  //   List<Map<String, dynamic>> conditions = [
  //     {
  //       "rule": {
  //         "key": "goals",
  //         "operator": "greaterthan",
  //         "value": "5"
  //       },
  //       "event": {
  //         "name": "scorer"
  //       }
  //     },
  //     {
  //       "rule": {
  //         "key": "wins",
  //         "operator": "greaterthan",
  //         "value": "10"
  //       },
  //       "event": {
  //         "name": "talisman"
  //       }
  //     }
  //   ];
  //   engine.addCondition(conditions);
  //   expect(engine.run(fact), false);
  // });

  // test('no conditions should pass', () {
  //   final engine = RuleEngine();

  //   Map<String, dynamic> fact = {};

  //   List<Map<String, dynamic>> conditions = [
  //     {
  //       "rule": {
  //         "key": "goals",
  //         "operator": "greaterthan",
  //         "value": "5"
  //       },
  //       "event": {
  //         "name": "scorer"
  //       }
  //     },
  //     {
  //       "rule": {
  //         "key": "wins",
  //         "operator": "greaterthan",
  //         "value": "10"
  //       },
  //       "event": {
  //         "name": "talisman"
  //       }
  //     }
  //   ];
  //   // engine.addCondition(conditions);
  //   expect(engine.run(fact), true);
  // });
}