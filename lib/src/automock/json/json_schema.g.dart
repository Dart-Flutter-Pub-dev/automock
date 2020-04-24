// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonSchema _$JsonSchemaFromJson(Map<String, dynamic> json) {
  return JsonSchema(
    type: json['type'] as String,
    $ref: json[r'$ref'] as String,
    items: json['items'],
  );
}

Map<String, dynamic> _$JsonSchemaToJson(JsonSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      r'$ref': instance.$ref,
      'items': instance.items,
    };
