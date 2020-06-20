import '../../config/type_tokens.dart';
import '../../rule.dart';
import '../lexer.dart';

abstract class Operation {
  Rule rule;
  Map<String, dynamic> facts;

  Operation(this.rule, this.facts);

  bool listOperation();
  bool mapOperation();
  bool stringOperation();
  bool numOperation();

  bool operate() {
    try {
      print('lexer result: ${Lexer().getType(rule.value)}');
      switch (Lexer().getType(rule.value)) {
        case TypeToken.STRING:
          print('string operation');
          return stringOperation();
          break;
        case TypeToken.NUM:
          print('num operation');
          return numOperation();
          break;
        case TypeToken.LIST:
          print('list operation');
          return listOperation();
          break;
        case TypeToken.MAP:
          print('map operation');
          return mapOperation();
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
