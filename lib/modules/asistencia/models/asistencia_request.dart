class AsistenciaRequest {
  final String docenteId;
  final String horarioId;
  final String ubicacionId;

  final double latitud;
  final double longitud;

  AsistenciaRequest({
    required this.docenteId,
    required this.horarioId,
    required this.ubicacionId,
    required this.latitud,
    required this.longitud,
  });

  Map<String, dynamic> toJson() {
    return {
      'docenteId': docenteId,
      'horarioId': horarioId,
      'ubicacionId': ubicacionId,
      'latitud': latitud,
      'longitud': longitud,
      'tipoMarcado': 'app_hospital',
      'notas': 'Marcado desde App',
    };
  }
}