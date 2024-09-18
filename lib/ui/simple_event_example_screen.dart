
import 'package:analitix/analitix/abstract/analytix_manager.dart';
import 'package:analitix/custom_reporters/screen_logger_reporter.dart';
import 'package:analitix/ui/screen_view_example_screen.dart';
import 'package:flutter/material.dart';

class SimpleEventExampleScreen extends StatefulWidget {
  @override
  State<SimpleEventExampleScreen> createState() => _SimpleEventExampleScreenState();
}

class _SimpleEventExampleScreenState extends State<SimpleEventExampleScreen> {

  int _counter = 0;
  late ScrollController _scrollController;
  bool _isDataCollectionEnabled = true;

  @override
  void initState() {
    AnalytixManager().logScreenView("simple_event_example_screen.dart");
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scroll to the bottom when the widget is built or updated
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytix Demo"),
        actions: [
          IconButton(
            tooltip: "Clear all reports",
            icon: const Icon(Icons.clear_all_rounded),
            onPressed: ScreenLoggerReporter().allReports.isNotEmpty ? () {
              setState(() {
                ScreenLoggerReporter().allReports.clear();
                _showSnackBar("All Reports Cleared");
              });
            } : null,
          ),
          IconButton(
            tooltip: "Navigate to new Screen",
            icon: const Icon(Icons.screen_rotation_outlined),
            onPressed: () async {
              _showSnackBar("Open new Screen");
              await Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenViewExampleScreen()));
              setState(() {});
            },
          ),
          // disable / enable button  for data collection
          IconButton(
            tooltip: "Disable / Enable Data Collection",
            icon: Icon(_isDataCollectionEnabled ? Icons.analytics : Icons.data_array),
            onPressed: () {
              _onDataCollectionChanged();
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Amount of Analytix Events:',
                textAlign: TextAlign.center,
              ),
              Text(
                ScreenLoggerReporter().allReports.length.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                child: ListView.builder(
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Event ${index+1}'),
                    subtitle: Text(ScreenLoggerReporter().allReports[index].toString()),
                  );
                },
                  itemCount: ScreenLoggerReporter().allReports.length,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Click',
        child: const Icon(Icons.ads_click),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    AnalytixManager().logEvent('click_events', 'button_press', params: {'counter': _counter});
    _showSnackBar("Button Pressed $_counter times");
  }

  _onDataCollectionChanged() {
    setState(() {
      _isDataCollectionEnabled = !_isDataCollectionEnabled;
      AnalytixManager().setAnalyticsCollectionEnabled(_isDataCollectionEnabled);
    });
    // Show a SnackBar message to indicate the change
    _showSnackBar(_isDataCollectionEnabled ? "Data Collection Enabled" : "Data Collection Disabled");
  }

  _showSnackBar(String message) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}