// lib/providers/auth_provider.dart

import 'package:flutter/material.dart';

import '../core/storage/storage_service.dart';
import '../models/usuario.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  Usuario? _usuario;
  String? _token;
  bool _loading = false;

  Usuario? get usuario => _usuario;
  String? get token => _token;
  bool get loading => _loading;
  bool get isAuthenticated => _usuario != null;

  Future<bool> login({required String email, required String password}) async {
    try {
      _loading = true;
      notifyListeners();

      final response = await _authService.login(
        email: email,
        password: password,
      );

      await StorageService().guardarTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

      _usuario = response.usuario;
      _token = response.accessToken;

      _loading = false;
      notifyListeners();

      return true;
    } catch (e) {
      _loading = false;
      notifyListeners();

      debugPrint(e.toString());

      return false;
    }
  }

  Future<void> logout() async {
    await StorageService().logout();

    _usuario = null;
    _token = null;

    notifyListeners();
  }
}
