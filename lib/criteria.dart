import 'config/criterias.dart';
import 'config/operators.dart';
import 'rule.dart';
import 'utils/operations/contains.dart';
import 'utils/operations/equals.dart';
import 'utils/operations/greater_than.dart';
import 'utils/operations/in.dart';
import 'utils/operations/less_than.dart';
import 'utils/operations/not_empty.dart';

bool evaluateCriteria(dynamic condition, Map<String, dynamic> facts) {
  bool flag = false;
  Map.castFrom(condition).keys.forEach((key) {
    if(condition[key] is Map) {
      if (key == CriteriaToken.ALL)
        flag = processAllCriteria(condition[key], facts);
      if (key == CriteriaToken.OR)
        flag = processOrCriteria(condition[key], facts);
      else {
        Rule rule = condition[key] is Rule ? condition[key] : Rule.tryParse(condition[key]);
        if (rule != null) flag = applyRule(rule, facts);
      }
    } else if(condition[key] is List) {
      for(var item in condition[key]) {
        Rule rule = item is Rule ? item : Rule.tryParse(item);
        if (rule != null) flag = applyRule(rule, facts);
      }
    }
  });
  return flag;
}

bool processAllCriteria(List rules, Map<String, dynamic> facts) {
  for(var rule in rules) {
    bool res = evaluateCriteria(rule, facts);
    if(!res) return false;
  }
  return true;
}

bool processOrCriteria(List rules, Map<String, dynamic> facts) {
  for(var rule in rules) {
    bool res = evaluateCriteria(rule, facts);
    if(res) return true;
  }
  return false;
}

bool applyRule(Rule rule, Map<String, dynamic> facts) {
  switch (rule.operand.toUpperCase()) {
    case Operators.EQUALS:
      print('operation: ==');
      return Equals(rule, facts).operate();
      break;
    case Operators.LESSTHAN:
      print('operation: <');
      return LessThan(rule, facts).operate();
      break;
    case Operators.GREATERTHAN:
      print('operation: >');
      return GreaterThan(rule, facts).operate();
      break;
    case Operators.NOTEMPTY:
      print('operation: not empty');
      return NotEmpty(rule, facts).operate();
      break;
    case Operators.CONTAINS:
      print('operation: contains');
      return Contains(rule, facts).operate();
      break;
    case Operators.IN:
      print('operation: in');
      return In(rule, facts).operate();
      break;
    default:
      break;
  }
  return false;
}
