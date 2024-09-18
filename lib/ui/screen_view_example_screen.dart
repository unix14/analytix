
import 'package:analitix/analitix/abstract/analytix_manager.dart';
import 'package:flutter/material.dart';

class ScreenViewExampleScreen extends StatefulWidget {
  const ScreenViewExampleScreen({super.key});

  @override
  State<ScreenViewExampleScreen> createState() => _ScreenViewExampleScreenState();
}

class _ScreenViewExampleScreenState extends State<ScreenViewExampleScreen> {

  @override
  void initState() {
    AnalytixManager().logScreenView("screen_view_example_screen.dart");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen View Example"),
      ),
      body: Center(
        child: Text(
          'This is the screen view example\n\nlog screen view event was sent to the reporter',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}