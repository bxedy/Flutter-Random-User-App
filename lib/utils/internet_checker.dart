import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> checkConnection() async {
  final bool isConnected = await InternetConnectionChecker().hasConnection;

  return isConnected;
}
