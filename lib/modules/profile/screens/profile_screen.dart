import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/app_drawer.dart';
import '../../../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(title: const Text('Perfil')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            const CircleAvatar(radius: 45, child: Icon(Icons.person, size: 45)),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                title: const Text('Nombre'),
                subtitle: Text(auth.usuario?.nombreCompleto ?? ''),
              ),
            ),

            Card(
              child: ListTile(
                title: const Text('Correo'),
                subtitle: Text(auth.usuario?.email ?? ''),
              ),
            ),

            Card(
              child: ListTile(
                title: const Text('Rol'),
                subtitle: Text(auth.usuario?.rol ?? ''),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(Icons.lock),

                label: const Text('Cambiar Contraseña'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
