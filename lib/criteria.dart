import 'config/criterias.dart';
import 'config/operators.dart';
import 'rule.dart';
import 'utils/operations/contains.dart';
import 'utils/operations/equals.dart';
import 'utils/operations/greater_than.dart';
import 'utils/operations/in.dart';
import 'utils/operations/less_than.dart';
import 'utils/operations/not_empty.dart';

int i = 0;

bool evaluateCriteria(dynamic condition, Map<String, dynamic> facts, {String token = CriteriaToken.ALL}) {
  bool flag = true;
  print('evaluating');
  Map.castFrom(condition).keys.forEach((key) {
    customPrint(key);
    if (key.toString().toUpperCase() == CriteriaToken.ALL) {
      customPrint('Flag before ALL: $flag');
      flag = flag && evaluateList(condition[key], facts, token: CriteriaToken.ALL);
      customPrint('Flag after ALL: $flag');
    }
    if (key.toString().toUpperCase() == CriteriaToken.ANY) {
      customPrint('Flag before ANY: $flag');
      flag = flag && evaluateList(condition[key], facts, token: CriteriaToken.ANY);
      customPrint('Flag after ANY: $flag');
    } else if (condition[key] is List) {
      customPrint('inside LIST');
      return evaluateList(condition[key], facts, token: token);
    }
  });
  customPrint('RESULT: $flag');
  return flag;
}

customPrint(String text) => print('$text ........${++i}');

bool evaluateList(List list, Map<String, dynamic> facts, {String token = CriteriaToken.ALL}) {
  switch (token) {
    case CriteriaToken.ALL:
      return processAllCriteria(list, facts, token: token);
      break;
    case CriteriaToken.ANY:
      return processAnyCriteria(list, facts, token: token);
      break;
    default:
      print('here');
      return false;
  }
}

bool processAllCriteria(List list, Map<String, dynamic> facts, {String token}) {
  bool flag = true;
  for (var item in list) {
    if (item is Rule)
      flag = flag && applyRule(item, facts);
    else
      flag = flag && evaluateCriteria(item, facts, token: token);
  }
  customPrint('Process ALL: $flag');
  return flag;
}

bool processAnyCriteria(List list, Map<String, dynamic> facts, {String token}) {
  bool flag = false;
  for (var item in list) {
    if (item is Rule)
      flag = flag || applyRule(item, facts);
    else
      flag = flag || evaluateCriteria(item, facts, token: token);
  }
  customPrint('Process ANY: $flag');
  return flag;
}

bool applyRule(Rule rule, Map<String, dynamic> facts) {
  switch (rule.operand.toUpperCase()) {
    case Operators.EQUALS:
      customPrint('operation: ==');
      return Equals(rule, facts).operate();
      break;
    case Operators.LESSTHAN:
      customPrint('operation: <');
      return LessThan(rule, facts).operate();
      break;
    case Operators.GREATERTHAN:
      customPrint('operation: >');
      return GreaterThan(rule, facts).operate();
      break;
    case Operators.NOTEMPTY:
      customPrint('operation: not empty');
      return NotEmpty(rule, facts).operate();
      break;
    case Operators.CONTAINS:
      customPrint('operation: contains');
      return Contains(rule, facts).operate();
      break;
    case Operators.IN:
      customPrint('operation: in');
      return In(rule, facts).operate();
      break;
    default:
      break;
  }
  return false;
}
