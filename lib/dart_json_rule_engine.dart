library dart_json_rule_engine;

import 'package:dart_json_rule_engine/condition.dart';
import 'package:dart_json_rule_engine/criteria.dart';
import 'package:dart_json_rule_engine/engine.dart';
import 'package:dart_json_rule_engine/utils/validations.dart';


class RuleEngine {
  Engine engine;

  RuleEngine() {
    this.engine = Engine();
  }
  void addCondition(List<Map<String, dynamic>> list) {
    if(!validateList(list)) throw Error.safeToString('Invalid conditions.');
    list.forEach((element) { 
      Condition condition = Condition.fromJson(element);
      if(condition == null) throw Error.safeToString('Invalid condition.');
      engine.addCondition(condition);
    });
  }

  void parseCriteria(Map<String, dynamic> obj) {
    Criteria criteria = Criteria.fromJson(obj);
    print(criteria);
    print(criteria.criteria.keys.length);
  }

  bool run(Map<String, dynamic> fact) {
    print(fact);
    return engine.run(fact);
  }
}
