import 'dart:io';
import 'package:automock/src/automock/end_point.dart';
import 'package:automock/src/automock/json/json_swagger.dart';

class MockServer {
  final int port;
  final String swaggerJson;
  final List<EndPoint> endPoints = <EndPoint>[];
  HttpServer server;

  MockServer(this.port, this.swaggerJson);

  Future<dynamic> start() async {
    final JsonSwagger swagger = JsonSwagger.load(swaggerJson);
    endPoints.addAll(swagger.endPoints());

    server = await HttpServer.bind(InternetAddress.anyIPv6, port);
    server.listen(onRequest);
  }

  Future<dynamic> stop() {
    return server.close();
  }

  void onRequest(HttpRequest request) {
    final String method = request.method;
    final String path = request.uri.path;

    for (EndPoint endPoint in endPoints) {
      if (!endPoint.hasPathParameters && endPoint.match(method, path)) {
        endPoint.fillResponse(request.response);
        return;
      }
    }

    for (EndPoint endPoint in endPoints) {
      if (endPoint.match(method, path)) {
        endPoint.fillResponse(request.response);
        return;
      }
    }

    final HttpResponse response = request.response;
    response.statusCode = 404;
    response.close();
  }
}
