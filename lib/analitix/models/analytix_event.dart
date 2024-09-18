
class AnalytixEvent {
  final String eventName;
  final String? subEventName;
  final Map<String, dynamic>? parameters;

  AnalytixEvent(this.eventName, {this.subEventName, this.parameters});

  @override
  String toString() {
    return 'AnalytixEvent: $eventName, subEventName: $subEventName, parameters: $parameters';
  }
}