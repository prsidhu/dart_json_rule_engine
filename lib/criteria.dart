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

bool evaluateCriteria(dynamic condition, Map<String, dynamic> facts) {
  bool flag = true;
  print('evaluating');
  Map.castFrom(condition).keys.forEach((key) {
    customPrint(key);
    if(condition[key] is Map) {
      customPrint('inside MAP');
      if (key == CriteriaToken.ALL.toLowerCase()) {
        customPrint('Flag before ALL: $flag');
        flag = flag && processAllCriteria(condition[key], facts);
        customPrint('Flag after ALL: $flag');
      }
      if (key == CriteriaToken.OR.toLowerCase()) {
        customPrint('Flag before OR: $flag');
        flag = flag && processOrCriteria(condition[key], facts);
        customPrint('Flag after OR: $flag');
      }
      else {
        Rule rule = condition[key] is Rule ? condition[key] : Rule.tryParse(condition[key]);
        if (rule != null) flag = flag && applyRule(rule, facts);
        customPrint('direct rule: $flag');
      }
    } else if(condition[key] is List) {
      customPrint('inside LIST');
      return evaluateList(condition[key], facts);
      // bool res = true;
      // for(var item in condition[key]) {
      //   Rule rule = item is Rule ? item : Rule.tryParse(item);
      //   if (rule != null) flag = applyRule(rule, facts);
      //   print('flag: $flag');
      // }
    }
  });
  customPrint('RESULT: $flag');
  return flag;
}

customPrint(String text) => print('$text ........${++i}');

bool evaluateList(List list, Map<String, dynamic> facts) {
  bool flag = true;
  for(var item in list) {
    if(item is Rule) flag = flag && applyRule(item, facts);
    else flag = flag && evaluateCriteria(item, facts);
  }
  customPrint('LIST FLAG: $flag');
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
