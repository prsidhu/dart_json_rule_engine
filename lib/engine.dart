import 'condition.dart';
import 'config/operators.dart';
import 'event.dart';

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
    print(conditions);
    conditions.forEach((Condition condition) { 
      if(!facts.containsKey(condition.rule.key)) facts[condition.rule.key] = null;
      print('checking');
      switch (condition.rule.operand.toUpperCase()) {
        case Operators.EQUALS:
          if(facts[condition.rule.key].toString().toLowerCase() == condition.rule.value.toString().toLowerCase())
            events.add(condition.event);
          break;
        case Operators.LESSTHAN:
          print('less than: ${num.tryParse(facts[condition.rule.key].toString()) < num.tryParse(condition.rule.value.toString())}');
          if(num.tryParse(facts[condition.rule.key].toString()) < num.tryParse(condition.rule.value.toString()))
            events.add(condition.event);
          break;
        case Operators.GREATERTHAN:
          print('greater than: ${num.tryParse(facts[condition.rule.key].toString()) > num.tryParse(condition.rule.value.toString())}');
          if(num.tryParse(facts[condition.rule.key].toString()) > num.tryParse(condition.rule.value.toString()))
            events.add(condition.event);
          break;
        case Operators.NOTEMPTY:
          if(facts[condition.rule.key] != null && facts[condition.rule.key].toString().length > 0)
            events.add(condition.event);
            break;
        default:
          break;
      }
    });
    return events;
  }
}