
import 'dart:io';
import 'package:analitix/analitix/models/analytix_event.dart';
import 'package:path_provider/path_provider.dart';
import '../extensions/file_extension.dart';
import '../abstract/base_reporter.dart';

/// CustomReporter class
/// This class is an example of a custom reporter that extends the BaseReporter class
/// we can add custom logic to this class
/// For example, we can use it in order to implement a 3rd party analytics service
/// such as Firebase analytics, Google analytics, Mixpanel, etc.
/// or to send the events to a custom server
class CustomReporter extends BaseReporter {

  @override
  void init() {
    print('CustomReporter: init');
    /// TODO: implement init
  }

  @override
  void logEvent(AnalytixEvent event) {
    print('CustomReporter: logEvent: $event');
    /// TODO: implement logEvent
  }
}