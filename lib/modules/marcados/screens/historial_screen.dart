import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/app_drawer.dart';
import '../../../providers/auth_provider.dart';

import '../providers/marcado_provider.dart';

class HistorialScreen extends StatefulWidget {
  const HistorialScreen({super.key});

  @override
  State<HistorialScreen> createState() => _HistorialScreenState();
}

class _HistorialScreenState extends State<HistorialScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final auth = context.read<AuthProvider>();

      final docenteId = auth.usuario?.docenteId;

      if (docenteId != null) {
        context.read<MarcadoProvider>().cargarHistorial(docenteId);
      }
    });
  }

  Color estadoColor(String estado) {
    switch (estado.toUpperCase()) {
      case 'PRESENTE':
        return Colors.green;

      case 'TARDANZA':
        return Colors.orange;

      case 'ABANDONO':
        return Colors.red;

      case 'AUSENTE':
        return Colors.redAccent;

      default:
        return Colors.grey;
    }
  }

  IconData estadoIcon(String estado) {
    switch (estado.toUpperCase()) {
      case 'PRESENTE':
        return Icons.check_circle;

      case 'TARDANZA':
        return Icons.schedule;

      case 'ABANDONO':
        return Icons.logout;

      case 'AUSENTE':
        return Icons.cancel;

      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MarcadoProvider>();

    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(title: const Text('Historial de Asistencias')),

      body: provider.loading
          ? const Center(child: CircularProgressIndicator())
          : provider.historial.isEmpty
          ? const Center(child: Text('No existen registros'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),

              itemCount: provider.historial.length,

              itemBuilder: (_, index) {
                final item = provider.historial[index];

                final color = estadoColor(item.estado);

                return Card(
                  elevation: 4,

                  margin: const EdgeInsets.only(bottom: 14),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,

                          backgroundColor: color,

                          child: Icon(
                            estadoIcon(item.estado),
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                item.estado,
                                style: TextStyle(
                                  color: color,

                                  fontWeight: FontWeight.bold,

                                  fontSize: 18,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(item.fecha),

                              const SizedBox(height: 4),

                              Text('Entrada: ${item.horaEntrada ?? "--"}'),

                              Text('Salida: ${item.horaSalida ?? "--"}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
