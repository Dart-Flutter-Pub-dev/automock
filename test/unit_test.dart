import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:automock/automock.dart';
import 'package:test/test.dart';

MockServer mockServer;

void main() {
  group('pets', () {
    setUp(() async {
      mockServer = await _mockServer();
    });

    tearDown(() {
      mockServer.stop();
    });

    test('get pet', () async {
      final http.Response response = await get('/pet/123');
      expect(response.body,
          '{\"id\":\"123\",\"category\":{\"id\":\"123\",\"name\":\"string\"},\"name\":\"doggie\",\"photoUrls\":[\"string\",\"string\",\"string\"],\"tags\":[{\"id\":\"123\",\"name\":\"string\"},{\"id\":\"123\",\"name\":\"string\"},{\"id\":\"123\",\"name\":\"string\"}],\"status\":\"string\"}');
    });

    test('find pet', () async {
      final http.Response response = await get('/pet/findByStatus');
      expect(response.body,
          '{\"id\":\"123\",\"category\":{\"id\":\"123\",\"name\":\"string\"},\"name\":\"doggie\",\"photoUrls\":[\"string\",\"string\",\"string\"],\"tags\":[{\"id\":\"123\",\"name\":\"string\"},{\"id\":\"123\",\"name\":\"string\"},{\"id\":\"123\",\"name\":\"string\"}],\"status\":\"string\"}');
    });

    test('post pet', () async {
      final http.Response response = await post('/pet', '{}');
      expect(response.statusCode, 204);
    });

    test('post pet2', () async {
      final http.Response response = await post('/pet/123', '{}');
      expect(response.statusCode, 204);
    });

    test('delete pet', () async {
      final http.Response response = await delete('/pet/123');
      expect(response.statusCode, 204);
    });

    test('post pet picture', () async {
      final http.Response response = await post('/pet/123/uploadImage', '{}');
      expect(response.statusCode, 204);
    });
  });

  group('users', () {
    setUp(() async {
      mockServer = await _mockServer();
    });

    test('post user', () async {
      final http.Response response = await post('/user', '{}');
      expect(response.statusCode, 204);
    });

    test('post user', () async {
      final http.Response response = await post('/user', '{}');
      expect(response.statusCode, 204);
    });
  });
}

Future<http.Response> get(String path) => http.get(url(path));

Future<http.Response> post(String path, dynamic body) =>
    http.post(url(path), body: body);

Future<http.Response> put(String path, dynamic body) =>
    http.put(url(path), body: body);

Future<http.Response> delete(String path) => http.delete(url(path));

String url(String path) => 'http://localhost:8080/v2$path';

Future<MockServer> _mockServer() async {
  if (mockServer == null) {
    final File file = File('example/swagger.json');
    final String swagger = await file.readAsString();

    mockServer = MockServer(8080, swagger);
    mockServer.start();
  }

  return mockServer;
}
