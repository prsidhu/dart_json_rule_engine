import 'package:dart_json_rule_engine/config/type_tokens.dart';

class Lexer {
  TypeToken getType(dynamic value) {
    print('runtime type: ${value.runtimeType}');
    if(value.runtimeType == Map) return TypeToken.MAP;
    if(value.runtimeType == List) return TypeToken.LIST;
    if(value.runtimeType == String) {
      if(num.tryParse(value) != null) return TypeToken.NUM;
      return TypeToken.STRING;
    }
  }
}