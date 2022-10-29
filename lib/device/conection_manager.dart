import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConectionManager {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  static final StreamController<bool> _messageStream =
      StreamController.broadcast();
  static Stream<bool> get messagesStream => _messageStream.stream;

  bool get isConection =>
      _connectionStatus != ConnectivityResult.none ? true : false;

  Future updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;
    print(result);
  }
}
