import 'package:automock/src/automock/definitions.dart';
import 'package:automock/src/automock/json_object.dart';
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

  dynamic value(Definitions definitions) =>
      _valueByJson(JsonObject.fromObject(this), definitions);

  dynamic _valueByRef(String ref, Definitions definitions) =>
      definitions.has(ref)
          ? _valueByJson(definitions.get(ref), definitions)
          : '';

  dynamic _valueByJson(JsonObject json, Definitions definitions) {
    if (json.has('type')) {
      final String type = json.get('type');

      if (type == 'object') {
        final Map<String, dynamic> result = <String, dynamic>{};
        final Map<String, dynamic> properties = json.get('properties');

        for (final String key in properties.keys) {
          final dynamic object = properties[key];
          final Object value =
              _valueByJson(JsonObject.fromObject(object), definitions);

          result[key] = value;
        }

        return result;
      } else if (type == 'string') {
        if (json.has('example')) {
          return json.get('example');
        } else {
          return 'string';
        }
      } else if (type == 'integer') {
        if (json.has('example')) {
          return json.get('example');
        } else {
          return '123';
        }
      } else if (type == 'number') {
        if (json.has('example')) {
          return json.get('example');
        } else {
          return '12.34';
        }
      } else if (type == 'boolean') {
        if (json.has('example')) {
          return json.get('example');
        } else {
          return 'true';
        }
      } else if (type == 'array') {
        final dynamic value =
            _valueByJson(JsonObject.fromObject(json.get('items')), definitions);
        final List<dynamic> array = <dynamic>[];

        array.add(value);
        array.add(value);
        array.add(value);

        return array;
      } else {
        return '';
      }
    } else if (json.has('\$ref')) {
      final String reference = ref(json.get('\$ref'));

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
