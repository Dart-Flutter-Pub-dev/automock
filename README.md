# Automock

An automatic mock server to speed up your initial development.

## Example

```dart
final File file = File('swagger.json');
final String swagger = await file.readAsString();

final Automock automock = Automock(
  port: 8080,
  swaggerJson: swagger,
);
await automock.start();
```