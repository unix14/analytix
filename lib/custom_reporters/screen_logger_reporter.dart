
import 'package:analitix/analitix/models/analytix_event.dart';
import '../analitix/abstract/base_reporter.dart';

/// ScreenLoggerReporter class
/// This class is an example of a custom reporter that extends the BaseReporter class
/// its responsibility is to log events to the screen
class ScreenLoggerReporter extends BaseReporter {

  ScreenLoggerReporter._internal();
  static final ScreenLoggerReporter _instance = ScreenLoggerReporter._internal();
  factory ScreenLoggerReporter() => _instance;

  List<String> allReports = [];

  @override
  void init() {
    print('ScreenLoggerReporter: init');
  }

  @override
  void logEvent(AnalytixEvent event) {
    print('ScreenLoggerReporter: logEvent: $event');
    allReports.add(event.toString());
  }
}