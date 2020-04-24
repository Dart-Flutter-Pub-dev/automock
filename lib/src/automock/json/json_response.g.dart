// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonResponse _$JsonResponseFromJson(Map<String, dynamic> json) {
  return JsonResponse(
    headers: (json['headers'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : JsonHeader.fromJson(e as Map<String, dynamic>)),
    ),
    schema: json['schema'] == null
        ? null
        : JsonSchema.fromJson(json['schema'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JsonResponseToJson(JsonResponse instance) =>
    <String, dynamic>{
      'headers': instance.headers,
      'schema': instance.schema,
    };
