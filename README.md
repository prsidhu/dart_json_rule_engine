
## A json / map based Dart rule engine with support for basic Dart data types.

* ### Available operations:
    * Equals
    * LessThan
    * GreaterThan
    * Contains
    * In

* ### Supported data types:
    * String
    * num
    * Map
    * List

* ### Supported criteria:
    * all
    * any

_Certain operations return a default boolean value. e.g. Contains on a num data type always returns false._


### Example

Implementations require conditions and facts (both json / ```Map<String, dynamic>```) to be supplied to the engine, which will return a boolean value upon evaluation.

```
  Map<String, dynamic> fact_1 = {
    'forward': 'Messi',
    'goals': 23,
    'club': 'Barcelona'
  };

  Map<String, dynamic> fact_2 = {
    'forward': 'Neymar',
    'goals': 18,
    'club': 'PSG'
  };

  Map<String, dynamic> condition = {
    'rule': {
      'all': [
        {
          'key': 'forward',
          'operator': 'in',
          'value': ['Messi', 'Ronaldo', 'Neymar']
        },
        {
          'any': [
            {
              'key': 'club',
              'operator': 'equals',
              'value': 'Liverpool'
            },
            {
              'key': 'goals',
              'operator': 'greaterthan',
              'value': 20
            }
          ]
        }
      ]
    }
  };
  RuleEngine engine = RuleEngine();
  engine.addCondition(condition);
  engine.run(fact_1);  // true
  engine.run(fact_2);  // false
```

* _if condition contains empty rules, then return true._
* _if valid condition is provided, but fact is empty, then return false._
