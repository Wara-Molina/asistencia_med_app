import 'package:flutter/material.dart';

import '../../../core/widgets/app_drawer.dart';

class HorariosScreen extends StatelessWidget {
  const HorariosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(title: const Text('Mis Horarios')),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: const [
          _HorarioCard(
            materia: 'Anatomía',
            paralelo: 'A',
            horario: '07:00 - 09:00',
            aula: 'Laboratorio 1',
            dia: 'Lunes',
          ),

          _HorarioCard(
            materia: 'Farmacología',
            paralelo: 'B',
            horario: '10:00 - 12:00',
            aula: 'Aula 202',
            dia: 'Martes',
          ),

          _HorarioCard(
            materia: 'Medicina Interna',
            paralelo: 'C',
            horario: '14:00 - 16:00',
            aula: 'Hospital Clínico',
            dia: 'Miércoles',
          ),
        ],
      ),
    );
  }
}

class _HorarioCard extends StatelessWidget {
  final String materia;
  final String paralelo;
  final String horario;
  final String aula;
  final String dia;

  const _HorarioCard({
    required this.materia,
    required this.paralelo,
    required this.horario,
    required this.aula,
    required this.dia,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              materia,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text('Día: $dia'),
            Text('Paralelo: $paralelo'),
            Text('Horario: $horario'),
            Text('Ubicación: $aula'),
          ],
        ),
      ),
    );
  }
}
