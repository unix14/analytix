# analytix

A Flutter library for custom analytics management, designed to streamline integration and usage for efficient event tracking and reporting in Dart applications.

## Features

- **Custom Event Tracking**: Easily log and manage events in your application.
- **Screen View Logging**: Track screen views to gain insights into user navigation.
- **Funnels Manager**: Tracks the time it takes the users go through a journey in our app.
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

## Funnels Manager

### Purpose
The `FunnelsManager` is a tool designed to track the sequence of user interactions or events in a specific flow, commonly referred to as a "funnel".

A funnel is a defined series of steps that a user follows, and by tracking how users interact with these steps, you can gather insights on engagement, abandonment points, and overall user behavior.

### Implementation

1. **Create and Start a Funnel**
To start tracking a funnel, you need to define a funnel using the `AnalytixFunnel` class and register it with the `FunnelsManager`.
Here’s an example of how to start a funnel:

```dart
   FunnelsManager().start(AnalytixFunnel(Funnels.funnel_2, shouldCountTime: true));
```

   •	Funnels.funnel_2 is the name of the funnel you’re tracking.
  
   •	The shouldCountTime flag tracks the time a user spends on each step of the funnel.
   

2.  **Tracking Events in the Funnel**
After starting the funnel, you can track specific events or steps within the funnel. For example:

```dart
    FunnelsManager().track(Funnels.funnel_3, "step_1");
```

This code logs the event "step_1" within the funnel_3.

3.	**Finishing a Funnel**
Once the funnel is complete (i.e., when the user completes all the steps), make sure to finish the funnel to capture the final event and any time-related data:

```dart
    FunnelsManager().finish(Funnels.funnel_2, "finish");
```
This marks the funnel as finished and logs the final event.

## More

For help getting started with Flutter development, view the online
[documentation](https://flutter.dev/).

For instructions integrating Flutter modules to your existing applications,
see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).
