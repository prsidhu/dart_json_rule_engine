import '../../condition.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import 'operation.dart';

class Contains extends Operation {

  Contains(Condition condition, Map<String, dynamic> facts) : super(condition, facts);

  @override
  bool listOperation() => List.from(facts[condition.rule.key]).contains(condition.rule.value);

  @override
  bool mapOperation() => Map.from(facts[condition.rule.key]).contains(condition.rule.value);

  @override
  bool numOperation() => num.parse(facts[condition.rule.key]).contains(num.parse(condition.rule.value));

  @override
  bool stringOperation() => facts[condition.rule.key].toString().contains(condition.rule.value.toString());
  
}