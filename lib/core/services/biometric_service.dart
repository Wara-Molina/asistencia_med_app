import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> autenticar() async {
    try {
      final bool disponible = await auth.canCheckBiometrics;

      if (!disponible) {
        return false;
      }

      return await auth.authenticate(
        localizedReason: 'Confirme su identidad para registrar asistencia',
        biometricOnly: true,
      );
    } catch (_) {
      return false;
    }
  }
}
