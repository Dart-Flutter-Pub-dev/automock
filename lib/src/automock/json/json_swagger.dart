import 'dart:convert';
import 'package:automock/src/automock/end_point.dart';
import 'package:automock/src/automock/json/json_end_point.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_swagger.g.dart';

@JsonSerializable()
class JsonSwagger {
  final String basePath;
  final Map<String, Map<String, JsonEndPoint>> paths;
  final Map<String, dynamic> definitions;

  const JsonSwagger({
    this.basePath = '',
    this.paths = const <String, Map<String, JsonEndPoint>>{},
    this.definitions = const <String, dynamic>{},
  });

  List<EndPoint> endPoints() {
    final List<EndPoint> endPoints = <EndPoint>[];

    for (final MapEntry<String, Map<String, JsonEndPoint>> pathEntry
        in paths.entries) {
      final String path = pathEntry.key;

      for (final MapEntry<String, JsonEndPoint> endPointEntry
          in pathEntry.value.entries) {
        final String method = endPointEntry.key;
        final JsonEndPoint jsonEndPoint = endPointEntry.value;

        endPoints.add(
          EndPoint(
              method: method.toUpperCase(),
              path: '$basePath$path',
              produces: jsonEndPoint.producesType(),
              responseCode: jsonEndPoint.responseCode(),
              headers: jsonEndPoint.headers(),
              schema: jsonEndPoint.schema(definitions)),
        );
      }
    }

    return endPoints;
  }

  static JsonSwagger load(String json) => fromJson(jsonDecode(json));

  static JsonSwagger fromJson(Map<String, dynamic> json) =>
      _$JsonSwaggerFromJson(json);

  static List<JsonSwagger> fromJsonList(List<dynamic> json) =>
      json.map((dynamic e) => _$JsonSwaggerFromJson(e)).toList();

  Map<String, dynamic> toJson() => _$JsonSwaggerToJson(this);
}
