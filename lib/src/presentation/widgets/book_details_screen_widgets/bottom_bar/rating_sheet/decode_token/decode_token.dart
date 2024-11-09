import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> decodeToken() async {
  try {
    final sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');

    if (token == null) {
      throw Exception('Token not found');
    }

    final jwt = JWT.decode(token);
    final userId = jwt.payload['id'] as String?;

    if (userId != null) {
      log(userId);
      return userId;
    } else {
      throw Exception('User ID not found in token payload');
    }
  } catch (e) {
    log("Error decoding token: $e");
    return null;
  }
}