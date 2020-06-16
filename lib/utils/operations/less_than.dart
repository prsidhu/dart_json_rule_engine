import '../../condition.dart';
import '../extensions/list_extension.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import '../extensions/string_extension.dart';
import 'operation.dart';

class LessThan extends Operation {

  LessThan(Condition condition, Map<String, dynamic> facts) : super(condition, facts);

  @override
  bool listOperation() => List.from(facts[condition.rule.key]).lessThan(List.from(condition.rule.value));

  @override
  bool mapOperation() => Map.from(facts[condition.rule.key]).lessThan(Map.from(condition.rule.value));

  @override
  bool numOperation() {
    print('< result: ${num.parse(facts[condition.rule.key].toString()).lessThan(num.parse(condition.rule.value.toString()))}');
    return num.parse(facts[condition.rule.key].toString()).lessThan(num.parse(condition.rule.value.toString()));
  }

  @override
  bool stringOperation() => facts[condition.rule.key].toString().lessThan(condition.rule.value.toString());
  
}