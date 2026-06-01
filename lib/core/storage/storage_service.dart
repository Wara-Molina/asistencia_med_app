// lib/core/storage/storage_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String tokenKey = 'access_token';
  static const String refreshKey = 'refresh_token';

  Future<void> guardarTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(tokenKey, accessToken);
    await prefs.setString(refreshKey, refreshToken);
  }

  Future<String?> obtenerToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(tokenKey);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }
}
