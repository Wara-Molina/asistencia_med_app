import 'package:flutter/material.dart';

import '../../../core/widgets/app_drawer.dart';

class HistorialScreen extends StatelessWidget {
  const HistorialScreen({super.key});

  Color _estadoColor(String estado) {
    switch (estado) {
      case 'PRESENTE':
        return Colors.green;

      case 'TARDANZA':
        return Colors.orange;

      case 'ABANDONO':
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final registros = [
      {'fecha': '05/06/2025', 'estado': 'PRESENTE'},
      {'fecha': '04/06/2025', 'estado': 'TARDANZA'},
      {'fecha': '03/06/2025', 'estado': 'ABANDONO'},
    ];

    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(title: const Text('Historial')),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),

        itemCount: registros.length,

        itemBuilder: (_, index) {
          final item = registros[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _estadoColor(item['estado']!),
              ),

              title: Text(
                item['estado']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text(item['fecha']!),
            ),
          );
        },
      ),
    );
  }
}
