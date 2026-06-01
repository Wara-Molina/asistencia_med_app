import 'package:flutter/material.dart';

import '../models/docente.dart';
import '../services/docente_service.dart';

class DocenteProvider extends ChangeNotifier {
  final DocenteService _service = DocenteService();

  bool loading = false;

  List<Docente> docentes = [];

  Future<void> cargarDocentes() async {
    loading = true;
    notifyListeners();

    docentes = await _service.obtenerDocentes();

    loading = false;
    notifyListeners();
  }
}
