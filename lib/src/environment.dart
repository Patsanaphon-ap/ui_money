import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Future<void> initialize() async {
    await dotenv.load(fileName: 'assets/env/.env');
  }

  static String get apiUrl =>
      dotenv.get('API_URL', fallback: 'API_URL not found');
}
