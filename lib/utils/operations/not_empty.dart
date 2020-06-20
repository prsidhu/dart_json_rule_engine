import '../../rule.dart';
import '../extensions/list_extension.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import '../extensions/string_extension.dart';
import 'operation.dart';

class NotEmpty extends Operation {

  NotEmpty(Rule rule, Map<String, dynamic> facts) : super(rule, facts);

  @override
  bool listOperation() => List.from(facts[rule.key]).notEmpty();

  @override
  bool mapOperation() => Map.from(facts[rule.key]).notEmpty();

  @override
  bool numOperation() => num.parse(facts[rule.key]).notEmpty();

  @override
  bool stringOperation() => facts[rule.key].toString().notEmpty();
  
}