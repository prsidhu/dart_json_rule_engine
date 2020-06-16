import '../../condition.dart';
import '../../config/type_tokens.dart';
import '../../event.dart';
import '../lexer.dart';

abstract class Operation {
  Condition condition;
  Map<String, dynamic> facts;

  Operation(this.condition, this.facts);

  bool listOperation();
  bool mapOperation();
  bool stringOperation();
  bool numOperation();

  Event operate() {
    try {
      print('find type');
      print('lexer result: ${Lexer().getType(condition.rule.value)}');
      switch (Lexer().getType(condition.rule.value)) {
        case TypeToken.STRING:
          print('string operation');
          if (stringOperation()) return condition.event;
          break;
        case TypeToken.NUM:
          print('num operation');
          if (numOperation()) return condition.event;
          break;
        case TypeToken.LIST:
          print('list operation');
          if (listOperation()) return condition.event;
          break;
        case TypeToken.MAP:
          print('map operation');
          if (mapOperation()) return condition.event;
          break;
        default:
          break;
      }
      return null;
    } catch (e) {
      print('error: $e');
      throw TypeError();
    }
  }
}
