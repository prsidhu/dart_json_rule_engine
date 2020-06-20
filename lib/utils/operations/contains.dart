import '../../rule.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import 'operation.dart';

class Contains extends Operation {

  Contains(Rule rule, Map<String, dynamic> facts) : super(rule, facts);

  @override
  bool listOperation() => List.from(facts[rule.key]).contains(rule.value);

  @override
  bool mapOperation() => Map.from(facts[rule.key]).contains(rule.value);

  @override
  bool numOperation() => num.parse(facts[rule.key]).contains(num.parse(rule.value));

  @override
  bool stringOperation() => facts[rule.key].toString().contains(rule.value.toString());
  
}