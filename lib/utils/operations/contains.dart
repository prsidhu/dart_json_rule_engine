import '../../condition.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import 'operation.dart';

class Contains extends Operation {

  Contains(Condition condition, Map<String, dynamic> facts) : super(condition, facts);

  @override
  bool listOperation() => List.from(condition.rule.value).contains(facts[condition.rule.key]);

  @override
  bool mapOperation() => Map.from(condition.rule.value).contains(facts[condition.rule.key]);

  @override
  bool numOperation() => num.parse(condition.rule.value).contains(num.parse(facts[condition.rule.key]));

  @override
  bool stringOperation() => facts[condition.rule.key].toString().contains(condition.rule.value.toString());
  
}