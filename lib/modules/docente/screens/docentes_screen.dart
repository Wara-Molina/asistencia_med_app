// lib/modules/docente/screens/docentes_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/docente_provider.dart';

class DocentesScreen extends StatefulWidget {
  const DocentesScreen({super.key});

  @override
  State<DocentesScreen> createState() => _DocentesScreenState();
}

class _DocentesScreenState extends State<DocentesScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<DocenteProvider>().cargarDocentes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DocenteProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Docentes')),
      body: provider.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.docentes.length,
              itemBuilder: (_, index) {
                final docente = provider.docentes[index];

                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(docente.nombreCompleto),
                  subtitle: Text(docente.departamento),
                );
              },
            ),
    );
  }
}
