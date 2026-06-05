// lib/modules/horarios/models/horario.dart
class Horario {
  final String id;

  final int diaSemana;

  final String horaInicio;

  final String horaFin;

  final String ubicacionId;

  final String materia;

  final String codigoMateria;

  final String ubicacion;

  final String tipoActividad;

  Horario({
    required this.id,
    required this.diaSemana,
    required this.horaInicio,
    required this.horaFin,
    required this.ubicacionId,
    required this.materia,
    required this.codigoMateria,
    required this.ubicacion,
    required this.tipoActividad,
  });

  factory Horario.fromJson(
    Map<String, dynamic> json,
  ) {
    return Horario(
      id: json['id'] ?? '',

      diaSemana: json['diaSemana'] ?? 0,

      horaInicio:
          json['horaInicio'] ?? '',

      horaFin:
          json['horaFin'] ?? '',

      ubicacionId:
          json['ubicacionId'] ?? '',

      materia:
          json['paralelo']?['materia']
                  ?['nombre'] ??
              'Sin materia',

      codigoMateria:
          json['paralelo']?['materia']
                  ?['codigo'] ??
              '',

      ubicacion:
          json['ubicacion']
                  ?['nombre'] ??
              'Sin ubicación',

      tipoActividad:
          json['tipoActividad'] ??
              '',
    );
  }
}