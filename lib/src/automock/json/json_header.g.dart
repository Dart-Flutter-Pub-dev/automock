// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonHeader _$JsonHeaderFromJson(Map<String, dynamic> json) {
  return JsonHeader(
    type: json['type'] as String?,
    format: json['format'] as String?,
    defaultValue: json['default'] as String?,
  );
}

Map<String, dynamic> _$JsonHeaderToJson(JsonHeader instance) =>
    <String, dynamic>{
      'type': instance.type,
      'format': instance.format,
      'default': instance.defaultValue,
    };
