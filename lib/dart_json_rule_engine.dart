library dart_json_rule_engine;

import 'package:dart_json_rule_engine/condition.dart';
import 'package:dart_json_rule_engine/engine.dart';
import 'package:dart_json_rule_engine/utils/validations.dart';


class RuleEngine {
  Engine engine;

  RuleEngine() {
    this.engine = Engine();
  }
  void addCondition(Map<String, dynamic> obj) {
    try {
      if(!validateMap(obj)) throw Error();
      Condition condition = Condition.fromJson(obj);
      engine.addCondition(condition);
    } catch(e) {
      print(e);
      throw Error.safeToString('Invalid conditions.');
    }
  }

  bool run(Map<String, dynamic> fact) {
    print(fact);
    return engine.run(fact);
  }
}
