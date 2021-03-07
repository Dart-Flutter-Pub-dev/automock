# Automock

An automatic mock server to speed up your initial development.

## Installation

Add the following dependency to your `pubspec.yaml`:

```yaml
dependencies: 
  automock: ^1.4.0
```

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