// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonSwagger _$JsonSwaggerFromJson(Map<String, dynamic> json) {
  return JsonSwagger(
    basePath: json['basePath'] as String,
    paths: (json['paths'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(
                k,
                e == null
                    ? null
                    : JsonEndPoint.fromJson(e as Map<String, dynamic>)),
          )),
    ),
    definitions: json['definitions'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$JsonSwaggerToJson(JsonSwagger instance) =>
    <String, dynamic>{
      'basePath': instance.basePath,
      'paths': instance.paths,
      'definitions': instance.definitions,
    };
