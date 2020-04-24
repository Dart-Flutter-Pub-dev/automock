import 'package:automock/src/automock/json/json_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_end_point.g.dart';

@JsonSerializable()
class JsonEndPoint {
  final List<String> produces;
  final Map<String, JsonResponse> responses;

  const JsonEndPoint({
    this.produces = const <String>[],
    this.responses = const <String, JsonResponse>{},
  });

  String producesType() {
    return ((produces != null) && (produces.isNotEmpty)) ? produces[0] : '';
  }

  int responseCode() {
    if (responses != null) {
      final MapEntry<String, JsonResponse> defaultResponse = _defaultResponse();

      return int.parse(defaultResponse.key);
    }

    return 204;
  }

  Map<String, String> headers() {
    if (responses != null) {
      final MapEntry<String, JsonResponse> defaultResponse = _defaultResponse();

      return defaultResponse.value.getHeaders;
    }

    return const <String, String>{};
  }

  String schema(Map<String, dynamic> definitions) {
    if (responses != null) {
      final MapEntry<String, JsonResponse> defaultResponse = _defaultResponse();

      return defaultResponse.value.getSchema(definitions);
    }

    return null;
  }

  MapEntry<String, JsonResponse> _defaultResponse() {
    if (responses != null) {
      for (MapEntry<String, JsonResponse> entry in responses.entries) {
        if (entry.key != 'default') {
          final int value = int.parse(entry.key);

          if ((value >= 200) && (value <= 299)) {
            return entry;
          }
        }
      }
    }

    return const MapEntry<String, JsonResponse>('204', JsonResponse());
  }

  static JsonEndPoint fromJson(Map<String, dynamic> json) =>
      _$JsonEndPointFromJson(json);

  static List<JsonEndPoint> fromJsonList(List<dynamic> json) =>
      json.map((dynamic e) => _$JsonEndPointFromJson(e)).toList();

  Map<String, dynamic> toJson() => _$JsonEndPointToJson(this);
}
