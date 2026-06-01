class Docente {
  final String id;
  final String nombreCompleto;
  final String email;
  final String cedula;
  final String departamento;
  final String estado;

  Docente({
    required this.id,
    required this.nombreCompleto,
    required this.email,
    required this.cedula,
    required this.departamento,
    required this.estado,
  });

  factory Docente.fromJson(Map<String, dynamic> json) {
    return Docente(
      id: json['id'] ?? '',
      nombreCompleto: json['nombreCompleto'] ?? '',
      email: json['email'] ?? '',
      cedula: json['cedula'] ?? '',
      departamento: json['departamento'] ?? '',
      estado: json['estado'] ?? '',
    );
  }
}
