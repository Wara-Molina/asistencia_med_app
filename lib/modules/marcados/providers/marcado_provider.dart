import 'package:flutter/material.dart';

import '../models/marcado.dart';
import '../services/marcado_service.dart';

class MarcadoProvider extends ChangeNotifier {
  final MarcadoService _service = MarcadoService();

  bool loading = false;

  List<Marcado> historial = [];

  Future<void> cargarHistorial(String docenteId) async {
    loading = true;
    notifyListeners();

    try {
      final data = await _service.obtenerHistorial(docenteId);

      historial = data.map<Marcado>((e) => Marcado.fromJson(e)).toList();
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
