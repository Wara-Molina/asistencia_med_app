// lib/modules/horarios/services/horario_service.dart

import '../../../core/api/api_client.dart';
import '../../../core/constants/api_constants.dart';

class HorarioService {
  final ApiClient _client = ApiClient();

  Future<List<dynamic>> obtenerHorariosDocente(
    String docenteId,
  ) async {
    final response = await _client.dio.get(
      '${ApiConstants.horarios}/docente/$docenteId',
    );

    return response.data['data'];
  }
}