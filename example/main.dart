import 'dart:io';
import 'package:automock/automock.dart';

Future<dynamic> main() async {
  final File file = File('example/swagger.json');
  final String swagger = await file.readAsString();

  final Automock automock = Automock(8080, swagger);
  await automock.start();
}
