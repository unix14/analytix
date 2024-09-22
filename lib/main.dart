import 'package:analitix/analitix/abstract/analytix_manager.dart';
import 'package:analitix/funnels_manager/analytix_funnel.dart';
import 'package:analitix/funnels_manager/funnels.dart';
import 'package:analitix/funnels_manager/funnels_manager.dart';
import 'package:flutter/material.dart';
import 'custom_reporters/screen_logger_reporter.dart';
import 'ui/analytix_example_screen.dart';

void main() {
  _initAnalytics();
  runApp(const AnalytixExampleScreen());
}

_initAnalytics() {
  // Init the AnalytixManager
  AnalytixManager().init();

  // Add the ScreenLoggerReporter
  AnalytixManager().addReporter(ScreenLoggerReporter());

  // Set the user properties
  AnalytixManager().setUserId("1234567890");
  AnalytixManager().setUserProperty("name", "Eyal");
  AnalytixManager().setUserProperty("last_name", "Yaakobi");
  AnalytixManager().setUserProperty("email", "eyalya94@gmail.com");
  AnalytixManager().setUserProperty("website", "https://www.3p-cups.com");
  AnalytixManager().setUserProperty("isMale", true);
  AnalytixManager().setUserProperty("isAdmin", false);
  AnalytixManager().setUserProperty("amountOfConnectedSessions", 3);
  AnalytixManager().setUserProperty("lastLoginTime", DateTime.now());
  AnalytixManager().setUserProperty("refreshToken", "FNvof-Qq3llcnu8nvknerk87@#aaAxz-zZq3");

  // Start f1 funnel
  FunnelsManager().start(AnalytixFunnel(Funnels.funnel_1, shouldCountTime: true));
}