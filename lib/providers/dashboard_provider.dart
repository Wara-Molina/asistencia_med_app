// lib/providers/dashboard_provider.dart
import 'package:flutter/material.dart';

import '../models/dashboard.dart';
import '../services/dashboard_service.dart';

class DashboardProvider extends ChangeNotifier {
  final DashboardService _service = DashboardService();

  Dashboard? dashboard;

  bool loading = false;

 Future<void> cargarDashboard() async {
  try {
    loading = true;
    notifyListeners();

    dashboard = await _service.obtenerDashboard();
  } catch (e) {
    debugPrint(e.toString());
  } finally {
    loading = false;
    notifyListeners();
  }
}
}
