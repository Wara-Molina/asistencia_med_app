import 'package:flutter/material.dart';

import '../../../core/widgets/app_drawer.dart';

class JustificacionesScreen extends StatelessWidget {
  const JustificacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(title: const Text('Justificaciones')),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        child: const Icon(Icons.add),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.pending),
              title: Text('Falta médica'),
              subtitle: Text('Pendiente'),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.check_circle),
              title: Text('Congreso académico'),
              subtitle: Text('Aprobada'),
            ),
          ),
        ],
      ),
    );
  }
}
