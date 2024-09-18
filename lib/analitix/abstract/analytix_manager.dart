

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
  Map<String, dynamic> _userProperties = {}; /// todo add device properties collection
  List<AnalytixEvent> _allEvents = [];

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

  void logEvent(String name, String subEventName, Map<String, dynamic> params) {
    if(!_isCollectionEnabled) {
      print('AnalytixManager logEvent: Collection is disabled');
      return;
    }
    print('AnalytixManager logEvent: $name, $params');

    for(BaseReporter reporter in reporters) {
      params['screenName'] = _screenName;
      params['userId'] = _userId;
      params['userProperties'] = _userProperties;
      var newEvent = AnalytixEvent(name, subEventName: subEventName, parameters: params);
      reporter.logEvent(newEvent);
      _allEvents.add(newEvent);
    }
  }

  void setUserProperty(String name, dynamic value) {
    print('AnalytixManager setUserProperty: $name, $value');
    _userProperties[name] = value;
  }

  void setUserId(String userId) {
    print('AnalytixManager setUserId: $userId');
    _userId = userId;
  }

  void setScreenName(String name) {
    print('AnalytixManager setScreenName: $name');
    _screenName = name;
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
    _allEvents.clear();
  }
}