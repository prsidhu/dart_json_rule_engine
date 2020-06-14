import 'package:dart_json_rule_engine/condition.dart';
import 'package:dart_json_rule_engine/config/operators.dart';
import 'package:dart_json_rule_engine/event.dart';
import 'package:dart_json_rule_engine/fact.dart';

const conditionError = 'Invalid condition';

class Engine {
  Condition condition;

  addCondition(Condition cd) {
    if(cd == null) throw Error.safeToString(conditionError);
    this.condition = cd;
  }

  bool run(Map<String, dynamic> fact) {
    if(this.condition == null) throw Error.safeToString(conditionError);
    if(fact == null) throw Error.safeToString('Invalid facts.');
    List<Event> list = evaluate(fact);
    return list.length > 0;
  }

  List<Event> evaluate(Map<String, dynamic> fact) {
    List<Event> events = List();
    switch (condition.rule.operand.toUpperCase()) {
      case Operators.EQUALS:
        if(fact[condition.rule.key].toString().toLowerCase() == condition.rule.value.toString().toLowerCase())
          events.add(condition.event);
        break;
      default:
        break;
    }
    return events;
  }
}