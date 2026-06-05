// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'modules/marcados/providers/marcado_provider.dart';
import 'providers/auth_provider.dart';
import 'modules/horarios/providers/horario_provider.dart';
import 'modules/docente/providers/docente_provider.dart';
import 'modules/asistencia/providers/asistencia_provider.dart';
import 'screens/login/login_screen.dart';
import 'providers/dashboard_provider.dart';

void main() {
  runApp(const AsistenciaApp());
}

class AsistenciaApp extends StatelessWidget {
  const AsistenciaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),

        ChangeNotifierProvider(create: (_) => DocenteProvider()),
        ChangeNotifierProvider(create: (_) => AsistenciaProvider()),
        ChangeNotifierProvider(create: (_) => HorarioProvider()),
        ChangeNotifierProvider(create: (_) => MarcadoProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Asistencia Medicina',

        theme: AppTheme.lightTheme,

        home: const LoginScreen(),
      ),
    );
  }
}
