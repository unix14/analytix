
import 'package:analitix/analitix/extensions/map_extenions.dart';

class AnalytixEvent {
  final String eventName;
  final String? subEventName;
  final Map<String, dynamic>? parameters;

  AnalytixEvent(this.eventName, {this.subEventName, this.parameters});

  @override
  String toString() {
    String result = 'AnalytixEvent: $eventName\nsubEventName: $subEventName';
    if(parameters?.isNotEmpty == true) {
      result += "\nparameters: ${parameters!.getString()}";
    }
    return result;
  }
}