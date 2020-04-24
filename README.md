# Automock

An automatic mock server to speed up your initial development.

## Example

```dart
final File file = File('swagger.json');
final String swagger = await file.readAsString();

final MockServer mockServer = MockServer(8080, swagger);
await mockServer.start();
```