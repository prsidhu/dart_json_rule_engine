import '../../rule.dart';
import '../extensions/list_extension.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import '../extensions/string_extension.dart';
import 'operation.dart';

class LessThan extends Operation {

  LessThan(Rule rule, Map<String, dynamic> facts) : super(rule, facts);

  @override
  bool listOperation() => List.from(facts[rule.key]).lessThan(List.from(rule.value));

  @override
  bool mapOperation() => Map.from(facts[rule.key]).lessThan(Map.from(rule.value));

  @override
  bool numOperation() => num.parse(facts[rule.key].toString()).lessThan(num.parse(rule.value.toString()));

  @override
  bool stringOperation() => facts[rule.key].toString().lessThan(rule.value.toString());
  
}