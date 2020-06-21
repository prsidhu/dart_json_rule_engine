import 'package:dart_json_rule_engine/config/type_tokens.dart';

class Lexer {
  TypeToken getType(dynamic value) {
    print('runtime type: ${value.runtimeType}');
    if(value is Map) return TypeToken.MAP;
    if(value is List) return TypeToken.LIST;
    if(value is int || value is double) return TypeToken.NUM;
    if(value is String) {
      if(num.tryParse(value) != null) return TypeToken.NUM;
      return TypeToken.STRING;
    }
    throw TypeError();
  }
}