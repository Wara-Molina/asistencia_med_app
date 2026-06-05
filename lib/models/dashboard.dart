// lib/models/dashboard.dart
class Dashboard {
  final int totalDocentes;

  final int totalMaterias;

  final int totalMarcados;

  final int validos;

  final int rechazados;

  final int abandonos;

  final double porcentajeGlobal;

  Dashboard({
    required this.totalDocentes,
    required this.totalMaterias,
    required this.totalMarcados,
    required this.validos,
    required this.rechazados,
    required this.abandonos,
    required this.porcentajeGlobal,
  });

  factory Dashboard.fromJson(
    Map<String, dynamic> json,
  ) {
    return Dashboard(
      totalDocentes:
          json['totalDocentes'] ?? 0,

      totalMaterias:
          json['totalMaterias'] ?? 0,

      totalMarcados:
          json['totalMarcados'] ?? 0,

      validos:
          json['validos'] ?? 0,

      rechazados:
          json['rechazados'] ?? 0,

      abandonos:
          json['abandonos'] ?? 0,

      porcentajeGlobal:
          (json['porcentajeGlobal'] ?? 0)
              .toDouble(),
    );
  }
}