import '../../condition.dart';
import '../extensions/list_extension.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import 'operation.dart';

class Equals extends Operation {
  
  Equals(Condition condition, Map<String, dynamic> facts): super(condition, facts);

  @override
  bool listOperation() => List.from(condition.rule.value).equals(List.from(facts[condition.rule.key]));

  @override
  bool mapOperation() => Map.from(condition.rule.value).equals(Map.from(facts[condition.rule.key]));

  @override
  bool numOperation() => num.parse(condition.rule.value).equals(num.parse(facts[condition.rule.key]));

  @override
  bool stringOperation() => condition.rule.value.equals(facts[condition.rule.key]);
}