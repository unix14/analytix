
import '../abstract/base_reporter.dart';
import '../models/analytix_event.dart';

/// PrinterReporter class
/// This class is responsible for printing the event to the console
/// It extends the BaseReporter class
class PrinterReporter extends BaseReporter {

  @override
  void init() {
    print('PrinterAnalytixReporter init');
  }

  @override
  void logEvent(AnalytixEvent event) {
    print('PrinterAnalytixManager:: Event: ${event.eventName}, SubEventName: ${event.subEventName}, parameters: ${event.parameters}');
  }
}