class Dashboard {
  final int totalDocentes;
  final int totalMaterias;
  final int totalHorarios;
  final int marcacionesHoy;
  final int justificacionesPendientes;
  final int observacionesPendientes;

  Dashboard({
    required this.totalDocentes,
    required this.totalMaterias,
    required this.totalHorarios,
    required this.marcacionesHoy,
    required this.justificacionesPendientes,
    required this.observacionesPendientes,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    return Dashboard(
      totalDocentes: json['totalDocentes'] ?? 0,
      totalMaterias: json['totalMaterias'] ?? 0,
      totalHorarios: json['totalHorarios'] ?? 0,
      marcacionesHoy: json['marcacionesHoy'] ?? 0,
      justificacionesPendientes: json['justificacionesPendientes'] ?? 0,
      observacionesPendientes: json['observacionesPendientes'] ?? 0,
    );
  }
}
