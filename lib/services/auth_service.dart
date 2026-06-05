// lib/services/auth_service.dart
import 'package:dio/dio.dart';

import '../core/api/api_client.dart';
import '../core/constants/api_constants.dart';
import '../models/login_response.dart';

class AuthService {
  final ApiClient _client = ApiClient();

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final Response response =
        await _client.dio.post(
      ApiConstants.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    return LoginResponse.fromJson(
      response.data['data'],
    );
  }
}