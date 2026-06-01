class Usuario {
  final String id;
  final String email;
  final String nombreCompleto;
  final String rol;
  final String? docenteId;

  Usuario({
    required this.id,
    required this.email,
    required this.nombreCompleto,
    required this.rol,
    this.docenteId,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      email: json['email'],
      nombreCompleto: json['nombreCompleto'],
      rol: json['rol'],
      docenteId: json['docenteId'],
    );
  }
}
