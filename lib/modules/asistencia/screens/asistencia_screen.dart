// lib/modules/asistencia/screens/asistencia_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/app_drawer.dart';
import '../../../core/services/biometric_service.dart';
import '../providers/asistencia_provider.dart';
import '../../horarios/providers/horario_provider.dart';
import '../../../providers/auth_provider.dart';
import '../services/asistencia_service.dart';

class AsistenciaScreen extends StatefulWidget {
  const AsistenciaScreen({super.key});

  @override
  State<AsistenciaScreen> createState() => _AsistenciaScreenState();
}

class _AsistenciaScreenState extends State<AsistenciaScreen> {
@override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback(
    (_) async {
      if (!mounted) return;

      final asistencia =
          context.read<AsistenciaProvider>();

      final horarios =
          context.read<HorarioProvider>();

      final auth =
          context.read<AuthProvider>();

      final docenteId =
          auth.usuario?.docenteId;

      if (docenteId != null) {
        await horarios.cargarHorarios(
          docenteId,
        );
      }

      asistencia.obtenerGPS();

      final vigente =
          horarios.obtenerHorarioVigente();

      if (vigente != null) {
        asistencia.establecerHorarioVigente(
          horarioActualId: vigente.id,
          ubicacionActualId:
              vigente.ubicacionId,
          descripcion:
              '${vigente.horaInicio} - ${vigente.horaFin}',
        );
      } else {
        asistencia.bloquearMarcacion();
      }
    },
  );
}
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AsistenciaProvider>();

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Registrar Asistencia')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            //-----------------------------------------
            // DOCENTE
            //-----------------------------------------
            Card(
              child: ListTile(
leading: const CircleAvatar(
  radius: 28,
  backgroundColor: Colors.white,
  child: Icon(
    Icons.medical_services,
  ),
),

title: Text(
  context.watch<AuthProvider>()
      .usuario
      ?.nombreCompleto ??
      'Docente',
),

              subtitle: Text(
  context.watch<AuthProvider>()
      .usuario
      ?.rol ??
      '',
),
              ),
            ),

            const SizedBox(height: 16),

            //-----------------------------------------
            // UBICACION
            //-----------------------------------------
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on, size: 30),

                title: const Text('Ubicación Actual'),

                subtitle: Text(provider.ubicacion),
              ),
            ),

            const SizedBox(height: 16),

            //-----------------------------------------
            // HORARIO
            //-----------------------------------------
            Card(
              child: ListTile(
                leading: const Icon(Icons.schedule, size: 30),

                title: const Text('Horario'),

                subtitle: Text(provider.horario),
              ),
            ),

            const SizedBox(height: 16),

            //-----------------------------------------
            // ESTADO
            //-----------------------------------------
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: provider.puedeMarcar
                    ? Colors.green.shade100
                    : Colors.red.shade100,

                borderRadius: BorderRadius.circular(16),
              ),

              child: Row(
                children: [
                  Icon(
                    provider.puedeMarcar ? Icons.verified : Icons.warning,
                    size: 32,
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      provider.puedeMarcar
                          ? 'Dentro del horario permitido'
                          : 'Fuera del horario permitido',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            //-----------------------------------------
            // INFORMACION
            //-----------------------------------------
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: const [
                    Text(
                      'Información',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Para registrar asistencia debe encontrarse dentro del área autorizada y validar su identidad mediante huella digital.',
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            //-----------------------------------------
            // BOTON
            //-----------------------------------------
            SizedBox(
              width: double.infinity,
              height: 65,

              child: ElevatedButton.icon(
                onPressed: provider.puedeMarcar
? () async {

  if (provider.latitud == null ||
      provider.longitud == null) {

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          'Esperando ubicación GPS',
        ),
      ),
    );

    return;
  }

  final ok =
      await BiometricService()
          .autenticar();
                        if (!context.mounted) return;

                      if (ok) {
  try {
    final auth =
        context.read<AuthProvider>();

    final docenteId =
        auth.usuario?.docenteId;

    if (docenteId == null) {
      throw Exception(
        'Docente no identificado',
      );
    }

    if (provider.horarioId == null) {
      throw Exception(
        'No existe horario vigente',
      );
    }

    if (provider.ubicacionId == null) {
      throw Exception(
        'No existe ubicación válida',
      );
    }

    if (provider.latitud == null ||
        provider.longitud == null) {
      throw Exception(
        'GPS no disponible',
      );
    }

    await AsistenciaService().registrar(
      docenteId: docenteId,
      horarioId: provider.horarioId!,
      ubicacionId: provider.ubicacionId!,
      latitud: provider.latitud!,
      longitud: provider.longitud!,
    );
    provider.bloquearMarcacion();

    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          'Asistencia registrada correctamente',
        ),
      ),
    );
  } catch (e) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );
  }
} else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Autenticación fallida'),
                            ),
                          );
                        }
                      }
                    : null,

                icon: const Icon(Icons.fingerprint, size: 30),

                label: const Text(
                  'REGISTRAR ASISTENCIA',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
