// models/login_response.dart
import 'usuario.dart';

class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final String expiresIn;
  final Usuario usuario;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.usuario,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expiresIn: json['expiresIn'],
      usuario: Usuario.fromJson(json['usuario']),
    );
  }
}
