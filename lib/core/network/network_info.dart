import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfo {
  final InternetConnectionChecker conectivity;

  NetworkInfo(this.conectivity);

  Future<bool> get connectivityResult => conectivity.hasConnection;
}
