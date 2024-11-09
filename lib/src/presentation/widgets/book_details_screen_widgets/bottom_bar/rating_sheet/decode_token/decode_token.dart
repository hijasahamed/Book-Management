import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

Future<String?> decodeToken() async {
  try {
    final sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');

    if (token == null) {
      throw Exception('Token not found');
    }

    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid JWT token');
    }

    final payload = utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
    final payloadMap = json.decode(payload) as Map<String, dynamic>;

    String userId = payloadMap['id'];
    log(userId);
    return userId;
  } catch (e) {
    return null; 
  }
}