
import '../models/analytix_event.dart';

abstract class BaseReporter {
  Future<void> init();
  void logEvent(AnalytixEvent event);
}