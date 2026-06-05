import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/services/location_service.dart';

class AsistenciaProvider extends ChangeNotifier {
  final LocationService _locationService =
      LocationService();

  bool loading = false;

  bool puedeMarcar = false;

  String ubicacion = 'Sin verificar';

  String horario = 'Sin horario';

  double? latitud;
  double? longitud;

  String? horarioId;

  String? ubicacionId;
  String get coordenadas =>
    latitud == null
        ? 'Sin ubicación'
        : '${latitud!.toStringAsFixed(6)}, '
          '${longitud!.toStringAsFixed(6)}';

  Future<void> obtenerGPS() async {
    try {
      loading = true;

      notifyListeners();

      Position pos =
          await _locationService.obtenerUbicacion();

      latitud = pos.latitude;
      longitud = pos.longitude;

      ubicacion =
          '${pos.latitude}, ${pos.longitude}';

      loading = false;

      notifyListeners();
    } catch (e) {
      loading = false;

      ubicacion = e.toString();

      notifyListeners();
    }
  }

  void establecerHorarioVigente({
    required String horarioActualId,
    required String ubicacionActualId,
    required String descripcion,
  }) {
    horarioId = horarioActualId;

    ubicacionId = ubicacionActualId;

    horario = descripcion;

    puedeMarcar = true;

    notifyListeners();
  }

  void bloquearMarcacion() {
    puedeMarcar = false;

    horarioId = null;

    ubicacionId = null;

    notifyListeners();
  }
}