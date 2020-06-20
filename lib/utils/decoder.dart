import 'dart:convert';

dynamic decode(dynamic obj) {
  try {
    return jsonDecode(obj);
  } catch(e) {
    if(e.toString().contains('FormatException'));
      return obj;
  }
}