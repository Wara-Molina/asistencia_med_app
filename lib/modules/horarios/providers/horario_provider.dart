import 'package:flutter/material.dart';

import '../models/horario.dart';
import '../services/horario_service.dart';

class HorarioProvider extends ChangeNotifier {
  final HorarioService _service =
      HorarioService();

  List<Horario> horarios = [];

  bool loading = false;

  Future<void> cargarHorarios(
    String docenteId,
  ) async {
    loading = true;
    notifyListeners();

    try {
      final data =
          await _service.obtenerHorariosDocente(
        docenteId,
      );

      horarios = data
          .map<Horario>(
            (e) => Horario.fromJson(e),
          )
          .toList();
    } catch (e) {
      debugPrint(
        'Error cargando horarios: $e',
      );
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Horario? obtenerHorarioVigente() {
    final ahora = DateTime.now();

    final diaActual =
        ahora.weekday - 1;

    for (final horario in horarios) {
      if (horario.diaSemana != diaActual) {
        continue;
      }

      final partesInicio =
          horario.horaInicio.split(':');

      final partesFin =
          horario.horaFin.split(':');

      final inicio = DateTime(
        ahora.year,
        ahora.month,
        ahora.day,
        int.parse(partesInicio[0]),
        int.parse(partesInicio[1]),
      );

      final fin = DateTime(
        ahora.year,
        ahora.month,
        ahora.day,
        int.parse(partesFin[0]),
        int.parse(partesFin[1]),
      );

      if (ahora.isAfter(inicio) &&
          ahora.isBefore(fin)) {
        return horario;
      }
    }

    return null;
  }
}