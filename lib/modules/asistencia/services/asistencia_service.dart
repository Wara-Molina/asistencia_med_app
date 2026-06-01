import '../../../core/api/api_client.dart';

class AsistenciaService {
  final ApiClient _client = ApiClient();

  Future<void> registrarEntrada({
    required String docenteId,
    required String horarioId,
    required String ubicacionId,
    required double latitud,
    required double longitud,
  }) async {
    await _client.dio.post(
      '/marcados',
      data: {
        'docenteId': docenteId,
        'horarioId': horarioId,
        'ubicacionId': ubicacionId,
        'latitud': latitud,
        'longitud': longitud,
        'tipoMarcado': 'app_hospital',
      },
    );
  }
}
