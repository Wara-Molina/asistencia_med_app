import 'package:flutter/material.dart';

import '../../screens/dashboard/dashboard_screen.dart';

import '../../modules/asistencia/screens/asistencia_screen.dart';

import '../../modules/horarios/screens/horarios_screen.dart';

import '../../modules/marcados/screens/historial_screen.dart';

import '../../modules/justificaciones/screens/justificaciones_screen.dart';

import '../../modules/profile/screens/profile_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 35, child: Icon(Icons.person, size: 35)),

                SizedBox(height: 10),

                Text(
                  'Sistema de Asistencia',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          //-----------------------------------------
          // DASHBOARD
          //-----------------------------------------
          ListTile(
            leading: const Icon(Icons.dashboard),

            title: const Text('Dashboard'),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const DashboardScreen()),
              );
            },
          ),

          //-----------------------------------------
          // ASISTENCIA
          //-----------------------------------------
          ListTile(
            leading: const Icon(Icons.fingerprint),

            title: const Text('Registrar Asistencia'),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AsistenciaScreen()),
              );
            },
          ),

          //-----------------------------------------
          // HORARIOS
          //-----------------------------------------
          ListTile(
            leading: const Icon(Icons.schedule),

            title: const Text('Mis Horarios'),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HorariosScreen()),
              );
            },
          ),

          //-----------------------------------------
          // HISTORIAL
          //-----------------------------------------
          ListTile(
            leading: const Icon(Icons.history),

            title: const Text('Historial'),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HistorialScreen()),
              );
            },
          ),

          //-----------------------------------------
          // JUSTIFICACIONES
          //-----------------------------------------
          ListTile(
            leading: const Icon(Icons.assignment),

            title: const Text('Justificaciones'),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const JustificacionesScreen(),
                ),
              );
            },
          ),

          //-----------------------------------------
          // PERFIL
          //-----------------------------------------
          ListTile(
            leading: const Icon(Icons.person),

            title: const Text('Perfil'),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),

          const Divider(),

          //-----------------------------------------
          // LOGOUT
          //-----------------------------------------
          ListTile(
            leading: const Icon(Icons.logout),

            title: const Text('Cerrar Sesión'),

            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
