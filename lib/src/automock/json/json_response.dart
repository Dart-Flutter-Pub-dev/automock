import 'package:automock/src/automock/definitions.dart';
import 'package:automock/src/automock/json/json_header.dart';
import 'package:automock/src/automock/json/json_schema.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_response.g.dart';

@JsonSerializable()
class JsonResponse {
  final Map<String, JsonHeader> headers;
  final JsonSchema schema;

  const JsonResponse({
    this.headers = const <String, JsonHeader>{},
    this.schema,
  });

  Map<String, String> get getHeaders {
    final Map<String, String> response = <String, String>{};

    if (headers != null) {
      for (final MapEntry<String, JsonHeader> header in headers.entries) {
        final JsonHeader jsonHeader = header.value;
        response[header.key] = jsonHeader.value;
      }
    }

    return response;
  }

  String getSchema(Definitions definitions) =>
      (schema != null) ? schema.value(definitions).toString() : null;

  static JsonResponse fromJson(Map<String, dynamic> json) =>
      _$JsonResponseFromJson(json);

  static List<JsonResponse> fromJsonList(List<dynamic> json) =>
      json.map((dynamic e) => _$JsonResponseFromJson(e)).toList();

  Map<String, dynamic> toJson() => _$JsonResponseToJson(this);
}
