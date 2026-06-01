import 'package:dio/dio.dart';

import '../../../core/api/api_client.dart';
import '../models/docente.dart';

class DocenteService {
  final ApiClient _client = ApiClient();

  Future<List<Docente>> obtenerDocentes() async {
    final Response response = await _client.dio.get('/docentes');

    return (response.data['data'] as List)
        .map((e) => Docente.fromJson(e))
        .toList();
  }
}
