
import '../models/analytix_event.dart';

abstract class BaseReporter {
  void init();
  void logEvent(AnalytixEvent event);
}