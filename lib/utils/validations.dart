bool validateMap(Map map) => map != null && map.keys.length > 0;

bool validateKey(String key, Map map) => validateMap(map) && map.containsKey(key);

bool validateList(List list) => list != null && list.length > 0;

bool validateInt(int i) => i != null && i > 0;

bool validateString(String str) => str != null && str.length > 0;