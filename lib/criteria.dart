import 'dart:convert';

import 'package:dart_json_rule_engine/config/criterias.dart';
import 'package:dart_json_rule_engine/rule.dart';
import 'package:dart_json_rule_engine/utils/validations.dart';

const criteriaError = 'Failed to parse criteria';
const tokenError = 'Invalid criteria';
const rulesError = 'Invalid rules';

class Criteria {
  Map<String, List<Rule>> criteria;

  Criteria({this.criteria});

  factory Criteria.fromJson(Map<String, dynamic> map) {
    try {
      Map<String, List<Rule>> res = {};
      if(validateMap(map)) {
        ///
        /// If input map doesn't contain any criteria at zeroth level,
        /// then treat is as ALL
        ///
        // if(!map.containsKey(CriteriaToken.ALL) && !map.containsKey(CriteriaToken.OR)) {
        //   Rule rule = Rule.fromJson(map);
        //   res['all'] = rule;
        // } else {
        //   map.keys.forEach((key) { 
        //     List list = [];
        //     if(validateList(map[key])){

        //     }
        //   });
        // }
        print('map validated');
        print(map.containsKey(CriteriaToken.ALL.toLowerCase()));
        print(map.containsKey(CriteriaToken.OR.toLowerCase()));
        if(!map.containsKey(CriteriaToken.ALL.toLowerCase()) && !map.containsKey(CriteriaToken.OR.toLowerCase())) {
          throw Error.safeToString(tokenError);
        }
        map.keys.forEach((key) { 
          print('key: $key');
          print(map[key]);
          if(!validateList(map[key])) throw Error.safeToString(rulesError);
          List<Rule> rules = [];
          for(var item in map[key]) {
            print(item);
            Rule rule = Rule.fromJson(item);
            rules.add(rule);
          }
          String token = key.toUpperCase() == CriteriaToken.ALL ? CriteriaToken.ALL : CriteriaToken.OR;
          res[token] = rules;
        });
        return Criteria(
          criteria: res
        );
      }
    } catch(e) {
      print(e);
      throw Error.safeToString(criteriaError);
    }
  }

  factory Criteria.fromRawJson(String str) => Criteria.fromJson(jsonDecode(str));
}