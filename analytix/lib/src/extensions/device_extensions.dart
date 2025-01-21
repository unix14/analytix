
import 'dart:io';

import 'package:flutter/foundation.dart';

extension DeviceExtension on dynamic {
  /// This function returns the device's name
  String get deviceName {
    return Platform.localHostname; // Returns the device's hostname
  }

  /// This function returns the device's platform
  String get devicePlatform {
    return Platform.isAndroid ? 'Android' : 'iOS';
  }

  /// This function returns the device's version
  String get deviceVersion {
    return Platform.version; // Note: This may not be available in all contexts
  }

  /// This function returns the device's identifier
  String get deviceIdentifier {
    return Platform.localHostname; // Not a unique identifier; used as a placeholder
  }

  /// This function returns the device's model
  String get deviceModel {
    return Platform.version;
  }

  /// This function returns the device's manufacturer
  String get deviceManufacturer {
    return Platform.isAndroid ? 'Unknown Manufacturer' : 'Apple';
  }

/// This function returns the device's isPhysicalDevice
  bool get isDebugMode {
    return kDebugMode;
  }

  Map<String, dynamic> get deviceProperties {
    return {
      'deviceName': deviceName,
      'devicePlatform': devicePlatform,
      'deviceVersion': deviceVersion,
      'deviceIdentifier': deviceIdentifier,
      'deviceModel': deviceModel,
      'deviceManufacturer': deviceManufacturer,
      'isDebugMode': isDebugMode,
    };
  }
}