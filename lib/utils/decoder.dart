import 'dart:convert';

dynamic decode(dynamic obj) {
  try {
    return jsonDecode(obj);
  } catch(e) {
    return obj;
  }
}