class Marcado {
  final String id;
  final String estado;
  final String fecha;
  final String? horaEntrada;
  final String? horaSalida;

  Marcado({
    required this.id,
    required this.estado,
    required this.fecha,
    this.horaEntrada,
    this.horaSalida,
  });

  factory Marcado.fromJson(Map<String, dynamic> json) {
    return Marcado(
      id: json['id'] ?? '',
      estado: json['estadoAsistencia'] ?? 'PENDIENTE',
      fecha: json['fechaCreacion'] ?? '',
      horaEntrada: json['horaInicio'],
      horaSalida: json['horaFin'],
    );
  }
}
