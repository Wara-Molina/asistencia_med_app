// lib/core/widgets/app_drawer.dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

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
         DrawerHeader(
  decoration: const BoxDecoration(
    color: AppColors.primary,
  ),

  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,

    children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.gold,
            width: 2,
          ),
        ),

        child: const CircleAvatar(
          radius: 36,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.medical_services,
            size: 36,
          ),
        ),
      ),

      const SizedBox(height: 12),

      const Text(
        'Sistema de Asistencia',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 4),

      const Text(
        'Facultad de Medicina - UPEA',
        style: TextStyle(
          color: Colors.white70,
        ),
      ),

      const SizedBox(height: 10),

      Container(
        width: 60,
        height: 2,
        color: AppColors.gold,
      ),
    ],
  ),
),
          //-----------------------------------------
          // DASHBOARD
          //-----------------------------------------
ListTile(
  leading: const Icon(
    Icons.dashboard_outlined,
    color: AppColors.primary,
  ),

  title: const Text(
    'Dashboard',
    style: TextStyle(
      fontWeight: FontWeight.w600,
    ),
  ),


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
            leading: const Icon(Icons.schedule_outlined),

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
            leading: const Icon(Icons.history_edu),

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
            leading: const Icon(Icons.assignment_turned_in),

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
            leading: const Icon(Icons.person_outline),

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
            leading: const Icon(
  Icons.logout,
  color: AppColors.danger,
),

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
