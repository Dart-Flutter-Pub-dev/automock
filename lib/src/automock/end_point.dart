import 'dart:io';

class EndPoint {
  final String method;
  final String path;
  final String route;
  final String produces;
  final int responseCode;
  final Map<String, String> headers;
  final String schema;

  EndPoint({
    this.method,
    this.path,
    this.produces,
    this.responseCode,
    this.headers,
    this.schema,
  }) : route = path.replaceAll(RegExp('\\{.*\\}'), '.*');

  bool get hasPathParameters => path != route;

  bool match(String method, String path) =>
      (method == this.method) && RegExp(route).hasMatch(path);

  void fillResponse(HttpResponse response) {
    response.statusCode = responseCode;

    if (produces != null) {
      response.headers.add('Content-Type', produces);
    }

    for (MapEntry<String, String> entry in headers.entries) {
      response.headers.add(entry.key, entry.value);
    }

    if (schema != null) {
      response.write(schema);
    }

    response.close();
  }
}
