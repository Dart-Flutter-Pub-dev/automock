import 'package:json_annotation/json_annotation.dart';

part 'json_header.g.dart';

@JsonSerializable()
class JsonHeader {
  final String type;
  final String format;
  @JsonKey(name: 'default')
  final String defaultValue;

  const JsonHeader({
    this.type = '',
    this.format = '',
    this.defaultValue = '',
  });

  String get value => defaultValue ?? '';

  static JsonHeader fromJson(Map<String, dynamic> json) =>
      _$JsonHeaderFromJson(json);

  static List<JsonHeader> fromJsonList(List<dynamic> json) =>
      json.map((dynamic e) => _$JsonHeaderFromJson(e)).toList();

  Map<String, dynamic> toJson() => _$JsonHeaderToJson(this);
}
