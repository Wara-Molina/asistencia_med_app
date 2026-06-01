import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/app_drawer.dart';
import '../../providers/auth_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Asistencia Medicina')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //-------------------------------------
            // BIENVENIDA
            //-------------------------------------
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Row(
                  children: [
                    const CircleAvatar(radius: 30, child: Icon(Icons.person)),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const Text(
                            'Bienvenido',
                            style: TextStyle(fontSize: 14),
                          ),

                          Text(
                            auth.usuario?.nombreCompleto ?? '',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            //-------------------------------------
            // ESTADISTICAS
            //-------------------------------------
            Row(
              children: [
                Expanded(
                  child: _DashboardCard(
                    icon: Icons.check_circle,
                    title: 'Asistencia',
                    value: 'Pendiente',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _DashboardCard(
                    icon: Icons.schedule,
                    title: 'Próxima Clase',
                    value: '--',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _DashboardCard(
                    icon: Icons.calendar_month,
                    title: 'Horarios',
                    value: 'Ver',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _DashboardCard(
                    icon: Icons.history,
                    title: 'Historial',
                    value: 'Ver',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            //-------------------------------------
            // BOTON PRINCIPAL
            //-------------------------------------
            SizedBox(
              width: double.infinity,
              height: 65,

              child: ElevatedButton.icon(
                onPressed: () {
                  // Navegar a asistencia
                },

                icon: const Icon(Icons.fingerprint),

                label: const Text(
                  'REGISTRAR ASISTENCIA',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            Icon(icon, size: 35),

            const SizedBox(height: 10),

            Text(title, textAlign: TextAlign.center),

            const SizedBox(height: 8),

            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
