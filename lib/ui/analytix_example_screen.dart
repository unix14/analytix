
import 'package:analitix/ui/simple_event_example_screen.dart';
import 'package:flutter/material.dart';

class AnalytixExampleScreen extends StatelessWidget {
  const AnalytixExampleScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analytix Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleEventExampleScreen(),
    );
  }
}