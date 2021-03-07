import 'package:automock/src/automock/json_object.dart';

class Definitions {
  final Map<String, JsonObject> json;

  Definitions({
    this.json = const <String, JsonObject>{},
  });

  bool has(String key) => json.containsKey(key);

  JsonObject? get(String key) => json[key];

  static Definitions fromJson(Map<String, dynamic> json) {
    final Map<String, JsonObject> result = <String, JsonObject>{};

    for (final String key in json.keys) {
      result[key] = JsonObject(json: json[key]);
    }

    return Definitions(json: result);
  }
}
