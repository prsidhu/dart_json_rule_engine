import '../../rule.dart';
import '../extensions/list_extension.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import '../extensions/string_extension.dart';
import 'operation.dart';

class GreaterThan extends Operation {

  GreaterThan(Rule rule, Map<String, dynamic> facts) : super(rule, facts);

  @override
  bool listOperation() => List.from(facts[rule.key]).greaterThan(List.from(rule.value));

  @override
  bool mapOperation() => Map.from(facts[rule.key]).greaterThan(Map.from(rule.value));

  @override
  bool numOperation() => num.parse(facts[rule.key].toString()).greaterThan(num.parse(rule.value.toString()));

  @override
  bool stringOperation() => facts[rule.key].toString().greaterThan(rule.value.toString());

}