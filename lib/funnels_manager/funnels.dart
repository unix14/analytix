
/// Funnels are used to track user journey within the app
/// and measure the time it takes to complete a certain journey
class Funnels {

  /// Funnel 1 is used to track the time it takes the users
  /// who just entered the app to click on the Funnels button
  static String funnel_1 = 'f#1';

  /// Funnel 2 is used to track the time it takes the users
  /// who are already in the funnels screen and then they click on the exit button
  static String funnel_2 = 'f#2';

  /// Funnel 3 is used to track the time it takes the users
  /// who are already in the funnels screen and then they move between the steps
  /// each step starts with start and ends with finish events
  /// in between we will report the step number and in the end we will report
  /// the time it takes to move between the steps
  /// it includes the following events:
  /// - start
  /// - step_1
  /// - step_2
  /// - step_3
  /// - finish
  static String funnel_3 = 'f#3';

  /// Funnel Internet is used for users who are already registered and logged in to the app
  /// we want to measure the events related to internet connection
  /// it includes the following events:
  /// - Internet_down
  /// - Internet_up (will be sent only if internet_down was sent)
  static String funnel_Internet = 'Internet';
}