import 'dart:io';
import 'package:mockserver/mockserver.dart';

class AutoEndPoint extends EndPoint {
  final String? produces;
  final int? responseCode;
  final Map<String, String>? headers;
  final String? schema;

  AutoEndPoint({
    required String method,
    required String path,
    this.produces,
    this.responseCode,
    this.headers,
    this.schema,
  }) : super(
          method: method,
          path: path,
        );

  @override
  void process(HttpRequest request, HttpResponse response) {
    response.statusCode = responseCode!;

    if (produces != null) {
      response.headers.add('Content-Type', produces!);
    }

    for (final MapEntry<String, String> entry in headers!.entries) {
      response.headers.add(entry.key, entry.value);
    }

    if (schema != null) {
      response.write(schema);
    }

    response.close();
  }
}
