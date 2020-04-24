import 'package:json_annotation/json_annotation.dart';

part 'json_schema.g.dart';

@JsonSerializable()
class JsonSchema {
  final String type;
  final String $ref;
  final dynamic items;

  const JsonSchema({
    this.type = '',
    this.$ref = '',
    this.items,
  });

  dynamic value(Map<String, dynamic> definitions) =>
      _valueByJson(this, definitions);

  dynamic _valueByRef(String ref, Map<String, dynamic> definitions) =>
      definitions.containsKey(ref)
          ? _valueByJson(definitions[ref], definitions)
          : '';

  dynamic _valueByJson(dynamic json, Map<String, dynamic> definitions) {
    if (json.type != null) {
      final String type = json.type;

      if (type == 'object') {
        const Map<String, dynamic> result = <String, dynamic>{};

        /*for (final String key in json.properties) {
          final dynamic object = json.properties.key;
          final Object value = _valueByJson(object, definitions);
          result['key'] = value;
        }*/

        return result;
      } else if (type == 'string') {
        if (json.example != null) {
          return json.example;
        } else {
          return 'string';
        }
      } else if (type == 'integer') {
        if (json.example != null) {
          return json.example;
        } else {
          return '123';
        }
      } else if (type == 'number') {
        if (json.example != null) {
          return json.example;
        } else {
          return '12.34';
        }
      } else if (type == 'boolean') {
        if (json.example != null) {
          return json.example;
        } else {
          return 'true';
        }
      } else if (type == 'array') {
        final dynamic value = _valueByJson(json.items, definitions);
        final List<dynamic> array = <dynamic>[];

        array.add(value);
        array.add(value);
        array.add(value);

        return array;
      } else {
        return '';
      }
    } else if (json.$ref != null) {
      final String reference = ref(json.$ref);

      return _valueByRef(reference, definitions);
    } else {
      return '';
    }
  }

  String ref(String value) =>
      (value != null) ? value.replaceAll('#/definitions/', '') : '';

  static JsonSchema fromJson(Map<String, dynamic> json) =>
      _$JsonSchemaFromJson(json);

  static List<JsonSchema> fromJsonList(List<dynamic> json) =>
      json.map((dynamic e) => _$JsonSchemaFromJson(e)).toList();

  Map<String, dynamic> toJson() => _$JsonSchemaToJson(this);
}
