import 'package:flutter/material.dart';

import '../models/dashboard.dart';
import '../services/dashboard_service.dart';

class DashboardProvider extends ChangeNotifier {
  final DashboardService _service = DashboardService();

  Dashboard? dashboard;

  bool loading = false;

  Future<void> cargarDashboard() async {
    loading = true;
    notifyListeners();

    dashboard = await _service.obtenerDashboard();

    loading = false;
    notifyListeners();
  }
}
