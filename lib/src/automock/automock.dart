import 'package:automock/src/automock/auto_end_point.dart';
import 'package:automock/src/automock/json/json_swagger.dart';
import 'package:mockserver/mockserver.dart';

class Automock {
  final int port;
  final String swaggerJson;
  MockServer _mockServer;

  Automock({
    this.port,
    this.swaggerJson,
  });

  Future<dynamic> start() async {
    final JsonSwagger swagger = JsonSwagger.load(swaggerJson);
    final List<AutoEndPoint> endPoints = <AutoEndPoint>[];
    endPoints.addAll(swagger.endPoints());

    _mockServer = MockServer(port: port, endPoints: endPoints);
    _mockServer.start();
  }

  Future<dynamic> stop() => _mockServer.stop();
}
