import '../../rule.dart';
import '../extensions/list_extension.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import '../extensions/string_extension.dart';
import 'operation.dart';

class Equals extends Operation {
  
  Equals(Rule rule, Map<String, dynamic> facts): super(rule, facts);

  @override
  bool listOperation() => List.from(rule.value).equals(List.from(facts[rule.key]));

  @override
  bool mapOperation() => Map.from(rule.value).equals(Map.from(facts[rule.key]));

  @override
  bool numOperation() => num.parse(rule.value).equals(num.parse(facts[rule.key]));

  @override
  bool stringOperation() => rule.value.toString().equals(facts[rule.key]);

}