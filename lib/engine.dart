import 'package:dart_json_rule_engine/utils/operations/contains.dart';
import 'package:dart_json_rule_engine/utils/operations/equals.dart';
import 'package:dart_json_rule_engine/utils/operations/greater_than.dart';
import 'package:dart_json_rule_engine/utils/operations/less_than.dart';
import 'package:dart_json_rule_engine/utils/operations/not_empty.dart';

import 'condition.dart';
import 'config/operators.dart';
import 'event.dart';
import 'utils/extensions/int_extension.dart';

const conditionError = 'Invalid condition';

class Engine {
  List<Condition> conditions = [];

  addCondition(Condition cd) {
    if(cd == null) throw Error.safeToString(conditionError);
    conditions.add(cd);
  }

  bool run(Map<String, dynamic> facts) {
    if(conditions == null) throw Error.safeToString(conditionError);
    if(facts == null) throw Error.safeToString('Invalid facts.');
    if(conditions.length == 0) return true;
    if(facts.keys.length == 0) return false;

    List<Event> list = evaluate(facts);
    print('events: ${list.length}');
    return list.length > 0;
  }

  List<Event> evaluate(Map<String, dynamic> facts) {
    List<Event> events = List();
    conditions.forEach((Condition condition) { 
      if(!facts.containsKey(condition.rule.key)) facts[condition.rule.key] = null;
      switch (condition.rule.operand.toUpperCase()) {
        case Operators.EQUALS:
          print('operation: ==');
          Event ev = Equals(condition, facts).operate();
          if(ev != null) events.add(ev);
          break;
        case Operators.LESSTHAN:
          print('operation: <');
          Event ev = LessThan(condition, facts).operate();
          if(ev != null) events.add(ev);
          break;
        case Operators.GREATERTHAN:
          print('operation: >');
          Event ev = GreaterThan(condition, facts).operate();
          if(ev != null) events.add(ev);
          break;
        case Operators.NOTEMPTY:
          print('operation: not empty');
          Event ev = NotEmpty(condition, facts).operate();
          if(ev != null) events.add(ev);
          break;
        case Operators.CONTAINS:
          print('operation: contains');
          Event ev = Contains(condition, facts).operate();
          if(ev != null) events.add(ev);
          break;
        default:
          break;
      }
    });
    return events;
  }
}