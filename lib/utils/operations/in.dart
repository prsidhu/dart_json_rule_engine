import '../../rule.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import 'operation.dart';

class In extends Operation {

  In(Rule rule, Map<String, dynamic> facts) : super(rule, facts);

  @override
  bool listOperation() => List.from(rule.value).contains(facts[rule.key]);

  @override
  bool mapOperation() => Map.from(rule.value).contains(facts[rule.key]);

  @override
  bool numOperation() => num.parse(rule.value).contains(num.parse(facts[rule.key]));

  @override
  bool stringOperation() => rule.value.toString().contains(facts[rule.key].toString());
  
}