//import 'package:flutter_riverpod/flutter_riverpod.dart';

class Env {
  // We add the api key by running 'flutter run --dart-define=movieApiKey=MYKEY
  final ApiKey = const String.fromEnvironment("ApiKey");
}

// final environmentConfigProvider = Provider<EnvironmentConfig>(
//   (ref) {
//     return EnvironmentConfig();
//   },
// );