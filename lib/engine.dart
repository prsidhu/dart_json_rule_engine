import 'condition.dart';
import 'criteria.dart';
import 'utils/validations.dart';

const conditionError = 'Invalid condition';

class Engine {
  Condition condition;

  addCondition(Condition cd) {
    if(cd == null) throw Error.safeToString(conditionError);
    condition = cd;
  }

  bool run(Map<String, dynamic> facts) {
    if(condition == null) throw Error.safeToString(conditionError);
    if(facts == null) throw Error.safeToString('Invalid facts.');
    if(!validateMap(condition.rules)) return true;
    if(facts.keys.length == 0) return false;

    return evaluateCriteria(condition.rules, facts);
  }
}