// lib/modules/profile/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_drawer.dart';
import '../../../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    final usuario = auth.usuario;

    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //------------------------------------
            // HEADER
            //------------------------------------

            Container(
              width: double.infinity,

              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                  ],
                ),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      border: Border.all(
                        color: AppColors.gold,
                        width: 3,
                      ),
                    ),

                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,

                      child: Icon(
                        Icons.person,
                        size: 55,
                        color: AppColors.primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    usuario?.nombreCompleto ?? '',
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    usuario?.rol.toUpperCase() ?? '',
                    style: const TextStyle(
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

            //------------------------------------
            // DATOS
            //------------------------------------

            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                children: [
                  _InfoCard(
                    icon: Icons.badge_outlined,
                    title: 'Nombre Completo',
                    value: usuario?.nombreCompleto ?? '',
                  ),

                  const SizedBox(height: 12),

                  _InfoCard(
                    icon: Icons.email_outlined,
                    title: 'Correo Electrónico',
                    value: usuario?.email ?? '',
                  ),

                  const SizedBox(height: 12),

                  _InfoCard(
                    icon: Icons.workspace_premium_outlined,
                    title: 'Rol',
                    value: usuario?.rol ?? '',
                  ),

                  const SizedBox(height: 12),

                  _InfoCard(
                    icon: Icons.fingerprint,
                    title: 'Docente ID',
                    value: usuario?.docenteId ?? 'No asignado',
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Próximamente',
                            ),
                          ),
                        );
                      },

                      icon: const Icon(Icons.lock_reset),

                      label: const Text(
                        'CAMBIAR CONTRASEÑA',
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: OutlinedButton.icon(
                      onPressed: () async {
                        await auth.logout();

                        if (!context.mounted) return;

                        Navigator.popUntil(
                          context,
                          (route) => route.isFirst,
                        );
                      },

                      icon: const Icon(
                        Icons.logout,
                        color: AppColors.danger,
                      ),

                      label: const Text(
                        'CERRAR SESIÓN',
                        style: TextStyle(
                          color: AppColors.danger,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Sistema de Control de Asistencia',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Facultad de Medicina - UPEA',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
            AppColors.primary.withValues(
  alpha: 26,
),

          child: Icon(
            icon,
            color: AppColors.primary,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),

        subtitle: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}