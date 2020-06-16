import '../../condition.dart';
import 'operation.dart';

import '../extensions/list_extension.dart';
import '../extensions/num_extension.dart';
import '../extensions/maps_extension.dart';
import '../extensions/string_extension.dart';

class GreaterThan extends Operation {

  GreaterThan(Condition condition, Map<String, dynamic> facts) : super(condition, facts);

  @override
  bool listOperation() => List.from(facts[condition.rule.key]).greaterThan(List.from(condition.rule.value));

  @override
  bool mapOperation() => Map.from(facts[condition.rule.key]).greaterThan(Map.from(condition.rule.value));

  @override
  bool numOperation() => num.parse(facts[condition.rule.key].toString()).greaterThan(num.parse(condition.rule.value.toString()));

  @override
  bool stringOperation() => facts[condition.rule.key].toString().greaterThan(condition.rule.value.toString());

}