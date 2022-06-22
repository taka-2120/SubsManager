import 'package:connectivity_plus/connectivity_plus.dart';

class Network {
  Future<bool> isConnected() async {
    bool canContinue = true;
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      canContinue = false;
    }

    return canContinue;
  }
}
