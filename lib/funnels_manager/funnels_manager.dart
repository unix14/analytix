
import 'funnel.dart';

class FunnelsManager {

  static final FunnelsManager _instance = FunnelsManager._internal();

  factory FunnelsManager() => _instance;
  FunnelsManager._internal();

  final Map<String, Funnel> _funnels = {};

  void start(Funnel funnel) {
    var funnelName = funnel.funnelName;
    if (_funnels[funnelName] == null) {
      print("FunnelsManager:: Adding funnel with name: $funnelName");
      _funnels[funnelName] = funnel;
      funnel.start();
    } else {
      print("FunnelsManager:: Funnel with name: $funnelName already exists");
    }
  }

  void track(String funnelName, String data) {
    if (_funnels[funnelName] == null) {
      print("FunnelsManager:: No funnel found with name: $funnelName");
      return;
    }
    _funnels[funnelName]?.track(data);
  }

  void finish(String funnelName, String data) {
    print("FunnelsManager:: Removing funnel with name: $funnelName");
    _funnels[funnelName]?.finish();
    // we are tracking the funnel only if it should count time
    if(_funnels[funnelName]?.shouldCountTime == true) {
      track(funnelName, data);
    }
    _funnels.remove(funnelName);
  }

  void clear() {
    print("FunnelsManager:: Clearing all funnels");
    _funnels.clear();
  }
}