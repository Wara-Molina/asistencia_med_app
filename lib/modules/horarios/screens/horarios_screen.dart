// lib/modules/horarios/screens/horarios_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/app_drawer.dart';

import '../../../providers/auth_provider.dart';

import '../providers/horario_provider.dart';

class HorariosScreen extends StatefulWidget {
  const HorariosScreen({super.key});

  @override
  State<HorariosScreen> createState() =>
      _HorariosScreenState();
}

class _HorariosScreenState
    extends State<HorariosScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final auth =
            context.read<AuthProvider>();

        final docenteId =
            auth.usuario?.docenteId;

        if (docenteId != null) {
          context
              .read<HorarioProvider>()
              .cargarHorarios(
                docenteId,
              );
        }
      },
    );
  }

  String obtenerDia(int dia) {
    switch (dia) {
      case 0:
        return "Lunes";

      case 1:
        return "Martes";

      case 2:
        return "Miércoles";

      case 3:
        return "Jueves";

      case 4:
        return "Viernes";

      case 5:
        return "Sábado";

      default:
        return "Domingo";
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<HorarioProvider>();
    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(
        title: const Text(
          'Mis Horarios',
        ),
      ),

      body: provider.loading
          ? const Center(
              child:
                  CircularProgressIndicator(),
            )
          : ListView.builder(
              padding:
                  const EdgeInsets.all(16),

              itemCount:
                  provider.horarios.length,

              itemBuilder: (_, index) {
                final horario =
                    provider.horarios[index];

                return Card(
                  margin:
                      const EdgeInsets.only(
                    bottom: 12,
                  ),

child: Padding(
  padding: const EdgeInsets.all(18),

  child: Column(
    crossAxisAlignment:
        CrossAxisAlignment.start,

    children: [

      Text(
        horario.materia,
        style: const TextStyle(
          fontSize: 20,
          fontWeight:
              FontWeight.bold,
        ),
      ),

      const SizedBox(height: 4),

      Text(
        horario.codigoMateria,
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),

      const Divider(height: 24),

      Row(
        children: [
          const Icon(
            Icons.calendar_today,
            size: 18,
          ),

          const SizedBox(width: 8),

          Text(
            obtenerDia(
              horario.diaSemana,
            ),
          ),
        ],
      ),

      const SizedBox(height: 10),

      Row(
        children: [
          const Icon(
            Icons.schedule,
            size: 18,
          ),

          const SizedBox(width: 8),

          Text(
            '${horario.horaInicio} - ${horario.horaFin}',
          ),
        ],
      ),

      const SizedBox(height: 10),

      Row(
        children: [
          const Icon(
            Icons.location_on,
            size: 18,
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Text(
              horario.ubicacion,
            ),
          ),
        ],
      ),

      const SizedBox(height: 10),

      Row(
        children: [
          const Icon(
            Icons.local_hospital,
            size: 18,
          ),

          const SizedBox(width: 8),

          Text(
            horario.tipoActividad
                .toUpperCase(),
          ),
        ],
      ),
    ],
  ),
),        );
              },
            ),
    );
  }
}
