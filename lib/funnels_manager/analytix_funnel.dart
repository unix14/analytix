
import 'package:analitix/analitix/abstract/analytix_manager.dart';
import 'package:flutter/foundation.dart';

import 'funnel.dart';

class AnalytixFunnel extends Funnel {

  // Constructor
  AnalytixFunnel(String funnelName, {bool shouldCountTime = false})
      : super(funnelName, shouldCountTime: shouldCountTime);

  @override
  void track(String eventName) {
    super.track(eventName);
    var shouldReport = !kDebugMode || true;
    if(shouldReport) {
      var shouldReportFunnelDuration = shouldCountTime && endTime != null && startTime != null;
      var durationTime = shouldReportFunnelDuration ? endTime!.difference(startTime!).inMilliseconds : 0;
      var duration = shouldReportFunnelDuration ? (durationTime.toString()) : "";
      AnalytixManager().logEvent(funnelName, eventName,
          params: shouldReportFunnelDuration ? {
          'duration': duration
          } : {}
      );
    }
  }
}