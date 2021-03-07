// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_end_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonEndPoint _$JsonEndPointFromJson(Map<String, dynamic> json) {
  return JsonEndPoint(
    produces:
        (json['produces'] as List<dynamic>?)?.map((e) => e as String).toList(),
    responses: (json['responses'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, JsonResponse.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$JsonEndPointToJson(JsonEndPoint instance) =>
    <String, dynamic>{
      'produces': instance.produces,
      'responses': instance.responses,
    };
