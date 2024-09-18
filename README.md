# analytix

A Flutter library for custom analytics management, designed to streamline integration and usage for efficient event tracking and reporting in Dart applications.

## Features

- **Custom Event Tracking**: Easily log and manage events in your application.
- **Screen View Logging**: Track screen views to gain insights into user navigation.
- **Robust Reporting**: Access detailed reports on user interactions and events.

## Getting Started

### Installation

To use the Analytix library, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  analytix: ^1.0.0  # Replace with the latest version
```

### Importing the Library
Import the library in your Dart files:

```dart
import 'package:analitix/analitix.dart';
```

### Basic Usage
Here’s a quick example of how to integrate Analytix into your Flutter application:

```dart
import 'package:flutter/material.dart';
import 'package:analitix/analitix/abstract/analytix_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SimpleEventExampleScreen(),
    );
  }
}

class SimpleEventExampleScreen extends StatefulWidget {
  @override
  State<SimpleEventExampleScreen> createState() => _SimpleEventExampleScreenState();
}

class _SimpleEventExampleScreenState extends State<SimpleEventExampleScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    AnalytixManager().logScreenView("simple_event_example_screen.dart");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytix Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Button pressed: $_counter times'),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    AnalytixManager().logEvent('button_press', 'User pressed the button', params: {'counter': _counter});
  }
}
```

For help getting started with Flutter development, view the online
[documentation](https://flutter.dev/).

For instructions integrating Flutter modules to your existing applications,
see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).
