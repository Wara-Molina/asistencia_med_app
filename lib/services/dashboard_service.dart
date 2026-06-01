import 'package:dio/dio.dart';

import '../core/api/api_client.dart';
import '../models/dashboard.dart';

class DashboardService {
  final ApiClient _client = ApiClient();

  Future<Dashboard> obtenerDashboard() async {
    final Response response = await _client.dio.get('/dashboard');

    return Dashboard.fromJson(response.data['data']);
  }
}
