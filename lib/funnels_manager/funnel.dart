

import 'package:flutter/cupertino.dart';

/// Funnel class to track user journey
/// it defines the structure of a funnel and its methods
abstract class Funnel {

  String funnelName;

  // Time management
  bool shouldCountTime;
  DateTime? startTime;
  DateTime? endTime;

  Funnel(this.funnelName, {this.shouldCountTime = false});

  void start() {
    if(shouldCountTime) {
      startTime = DateTime.now();
    }
    print("Funnel Tracking:: Start: $funnelName");
  }

  @mustCallSuper
  void track(String eventName) {
    print("Funnel Tracking:: $funnelName: $eventName");
  }

  void finish() {
    if (shouldCountTime) {
      endTime = DateTime.now();
    }
    print("Funnel Tracking:: End: $funnelName ${shouldCountTime ? ", Duration: ${endTime!.difference(startTime!)}" : ""}");
  }
}