import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}
/// It's a wrapper around the InternetConnectionChecker class that exposes a single method called
/// isConnected

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _connectionChecker;

  NetworkInfoImpl(this._connectionChecker);
  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}
