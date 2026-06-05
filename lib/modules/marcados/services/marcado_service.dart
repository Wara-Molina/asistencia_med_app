import '../../../core/api/api_client.dart';

class MarcadoService {
  final ApiClient _client = ApiClient();

  Future<List<dynamic>> obtenerHistorial(String docenteId) async {
    final response = await _client.dio.get('/marcados/docente/$docenteId');

    return response.data['data'];
  }
}
