import 'package:analytix/analytix.dart';
import 'package:analytix/src/abstract/analytix_manager.dart';


void main() {
  _initAnalytics();
  _testAnalytics();
}

_testAnalytics() {
  // Log a screen view
  AnalytixManager().logScreenView("HomeScreen");

  // Log an event
  AnalytixManager().logEvent("button_click", "login_button", params: {
    "button_name": "login",
    "button_color": "blue",
    "button_size": "large",
  });
}

_initAnalytics() {
  // Init the AnalytixManager
  AnalytixManager().init();

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
}