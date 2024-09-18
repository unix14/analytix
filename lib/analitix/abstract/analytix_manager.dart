

import 'package:analitix/analitix/abstract/base_reporter.dart';
import 'package:analitix/analitix/reporters/custom_reporter.dart';
import 'package:analitix/analitix/reporters/printer_reporter.dart';

import '../models/analytix_event.dart';
import '../reporters/excel_reporter.dart';

class AnalytixManager {

  static final AnalytixManager _instance = AnalytixManager._internal();

  bool _isCollectionEnabled = true;
  String? _screenName;
  String? _userId;
  Map<String, dynamic> _userProperties = {};
  Map<String, dynamic> _deviceProperties = {};
  final List<AnalytixEvent> _allEvents = [];

  factory AnalytixManager() {
    return _instance;
  }

  AnalytixManager._internal();

  List<BaseReporter> reporters = [
    PrinterReporter(),
    CustomReporter(),
    ExcelReporter(),
  ];

  void init() {
    print('AnalytixManager init');
  }

  void logScreenView(String screenName) {
    print('AnalytixManager setScreenName: $screenName');
    _screenName = screenName;
    logEvent('screen_view', screenName);
  }

  void logEvent(String name, String subEventName, {Map<String, dynamic> params = const {} }) {
    if(!_isCollectionEnabled) {
      print('AnalytixManager logEvent: Collection is disabled');
      return;
    }
    print('AnalytixManager logEvent: $name, $params');
    Map<String, dynamic> newParams = {};
    newParams.addAll(params);

    for(BaseReporter reporter in reporters) {
      newParams['screenName'] = _screenName;
      newParams['userId'] = _userId;
      newParams['userProperties'] = _userProperties;
      newParams['deviceProperties'] = _deviceProperties;
      newParams['eventTime'] = DateTime.now();
      var newEvent = AnalytixEvent(name, subEventName: subEventName, parameters: newParams);
      reporter.logEvent(newEvent);
      _allEvents.add(newEvent);
    }
  }

  void addReporters(List<BaseReporter> reporters) {
    reporters.addAll(reporters);
  }

  void addReporter(BaseReporter reporter) {
    reporters.add(reporter);
  }

  void removeReporters(List<BaseReporter> reporters) {
    reporters.removeWhere((element) => reporters.contains(element));
  }

  void removeReporter(BaseReporter reporter) {
    reporters.remove(reporter);
  }

  void clearReporters() {
    reporters.clear();
  }

  void setDeviceProperties(Map<String, dynamic> properties) {
    print('AnalytixManager setDeviceProperties: $properties');
    _userProperties.addAll(properties);
  }

  void setUserProperty(String name, dynamic value) {
    print('AnalytixManager setUserProperty: $name, $value');
    _userProperties[name] = value;
  }

  void setUserId(String userId) {
    print('AnalytixManager setUserId: $userId');
    _userId = userId;
  }

  void setAnalyticsCollectionEnabled(bool enabled) {
    print('AnalytixManager setAnalyticsCollectionEnabled: $enabled');
    _isCollectionEnabled = enabled;
  }

  void resetAnalyticsData() {
    print('AnalytixManager resetAnalyticsData');
    _userId = null;
    _screenName = null;
    _userProperties = {};
    _deviceProperties = {};
    _allEvents.clear();
  }
}