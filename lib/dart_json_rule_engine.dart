library dart_json_rule_engine;

import 'package:dart_json_rule_engine/condition.dart';
import 'package:dart_json_rule_engine/engine.dart';

/// A Calculator.
class RuleEngine {
  Engine engine;

  RuleEngine() {
    this.engine = Engine();
  }
  void addCondition(Map<String, dynamic> map) {
    Condition condition = Condition.fromJson(map);
    engine.addCondition(condition);
  }

  bool run(Map<String, dynamic> fact) {
    print(fact);
    return engine.run(fact);
  }
}
