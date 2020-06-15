import 'condition.dart';
import 'config/operators.dart';
import 'event.dart';

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
      case Operators.LESSTHAN:
        if(num.tryParse(fact[condition.rule.key]) < num.tryParse(condition.rule.value))
          events.add(condition.event);
        break;
      case Operators.GREATERTHAN:
        if(num.tryParse(fact[condition.rule.key]) > num.tryParse(condition.rule.value))
          events.add(condition.event);
        break;
      case Operators.NOTEMPTY:
        if(fact[condition.rule.key] != null && fact[condition.rule.key].toString().length > 0)
          events.add(condition.event);
          break;
      default:
        break;
    }
    return events;
  }
}