import '../../condition.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import 'operation.dart';

class In extends Operation {

  In(Condition condition, Map<String, dynamic> facts) : super(condition, facts);

  @override
  bool listOperation() => List.from(condition.rule.value).contains(facts[condition.rule.key]);

  @override
  bool mapOperation() => Map.from(condition.rule.value).contains(facts[condition.rule.key]);

  @override
  bool numOperation() => num.parse(condition.rule.value).contains(num.parse(facts[condition.rule.key]));

  @override
  bool stringOperation() => condition.rule.value.toString().contains(facts[condition.rule.key].toString());
  
}