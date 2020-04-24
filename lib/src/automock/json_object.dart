import 'dart:convert';

class JsonObject {
  final Map<String, dynamic> json;

  JsonObject({
    this.json = const <String, dynamic>{},
  });

  bool has(String key) => json.containsKey(key);

  dynamic get(String key) => json[key];

  Iterable<String> get keys => json.keys;

  static JsonObject fromObject(Object object) {
    final String json = jsonEncode(object);

    return JsonObject(json: jsonDecode(json));
  }
}
