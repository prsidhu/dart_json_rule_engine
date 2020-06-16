import '../../condition.dart';
import '../extensions/list_extension.dart';
import '../extensions/maps_extension.dart';
import '../extensions/num_extension.dart';
import '../extensions/string_extension.dart';
import 'operation.dart';

class NotEmpty extends Operation {

  NotEmpty(Condition condition, Map<String, dynamic> facts) : super(condition, facts);

  @override
  bool listOperation() => List.from(facts[condition.rule.key]).notEmpty();

  @override
  bool mapOperation() => Map.from(facts[condition.rule.key]).notEmpty();

  @override
  bool numOperation() => num.parse(facts[condition.rule.key]).notEmpty();

  @override
  bool stringOperation() => facts[condition.rule.key].toString().notEmpty();
  
}