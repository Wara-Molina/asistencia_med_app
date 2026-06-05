// lib/screens/dashboard/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_drawer.dart';

import '../../providers/auth_provider.dart';
import '../../providers/dashboard_provider.dart';

import '../../modules/asistencia/screens/asistencia_screen.dart';
import '../../modules/horarios/screens/horarios_screen.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}
class _DashboardScreenState
    extends State<DashboardScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context
            .read<DashboardProvider>()
            .cargarDashboard();
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final auth =
        context.watch<AuthProvider>();

    final dashboard =
        context.watch<DashboardProvider>();

    return Scaffold(
      drawer: const AppDrawer(),

      body: dashboard.loading
          ? const Center(
              child:
                  CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [

                  //--------------------------------
                  // HEADER
                  //--------------------------------

                  Container(
                    width: double.infinity,

                    padding:
                        const EdgeInsets.only(
                      top: 60,
                      left: 20,
                      right: 20,
                      bottom: 30,
                    ),

                    decoration:
                        const BoxDecoration(
                      gradient:
                          LinearGradient(
                        colors: [
                          AppColors.primary,
                          AppColors.secondary,
                        ],
                      ),

                      borderRadius:
                          BorderRadius.only(
                        bottomLeft:
                            Radius.circular(
                          35,
                        ),
                        bottomRight:
                            Radius.circular(
                          35,
                        ),
                      ),
                    ),

                    child: Column(
                      children: [

                        Row(
                          children: [

                            Builder(
                              builder:
                                  (context) =>
                                      IconButton(
                                icon:
                                    const Icon(
                                  Icons.menu,
                                  color:
                                      Colors.white,
                                ),

                                onPressed: () {
                                  Scaffold.of(
                                    context,
                                  ).openDrawer();
                                },
                              ),
                            ),

                            const Spacer(),

                            Container(
                              padding:
                                  const EdgeInsets
                                      .all(
                                8,
                              ),

                              decoration:
                                  BoxDecoration(
                                color:
                                    Colors.white24,

                                borderRadius:
                                    BorderRadius.circular(
                                  12,
                                ),
                              ),

                              child:
                                  const Icon(
                                Icons.notifications_none,
                                color:
                                    Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Container(
                          decoration:
                              BoxDecoration(
                            shape:
                                BoxShape.circle,

                            border:
                                Border.all(
                              color:
                                  AppColors.gold,
                              width: 2,
                            ),
                          ),

                          child:
                              const CircleAvatar(
                            radius: 40,
                            backgroundColor:
                                Colors.white,

                            child: Icon(
                              Icons
                                  .medical_services,
                              size: 40,
                              color:
                                  AppColors.primary,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        const Text(
                          'Bienvenido',
                          style:
                              TextStyle(
                            color:
                                Colors.white70,
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        Text(
                          auth.usuario
                                  ?.nombreCompleto ??
                              '',
                          textAlign:
                              TextAlign.center,

                          style:
                              const TextStyle(
                            color:
                                Colors.white,

                            fontSize:
                                22,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                          height: 6,
                        ),

                        Text(
                          auth.usuario
                                  ?.rol
                                  .toUpperCase() ??
                              '',

                          style:
                              const TextStyle(
                            color:
                                Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //--------------------------------
                  // CONTENIDO
                  //--------------------------------

                  Padding(
                    padding:
                        const EdgeInsets.all(
                      16,
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [

                        const Text(
                          'Resumen General',
                          style:
                              TextStyle(
                            fontSize:
                                22,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        GridView.count(
                          shrinkWrap: true,

                          physics:
                              const NeverScrollableScrollPhysics(),

                          crossAxisCount:
                              2,

                          childAspectRatio:
                              1.2,

                          crossAxisSpacing:
                              12,

                          mainAxisSpacing:
                              12,

                          children: [

                            _MetricCard(
                              icon:
                                  Icons.people,
                              title:
                                  'Docentes',
                              value:
                                  '${dashboard.dashboard?.totalDocentes ?? 0}',
                              color:
                                  AppColors.primary,
                            ),

                            _MetricCard(
                              icon:
                                  Icons.menu_book,
                              title:
                                  'Materias',
                              value:
                                  '${dashboard.dashboard?.totalMaterias ?? 0}',
                              color:
                                  Colors.indigo,
                            ),

                            _MetricCard(
                              icon:
                                  Icons
                                      .fingerprint,
                              title:
                                  'Marcados',
                              value:
                                  '${dashboard.dashboard?.totalMarcados ?? 0}',
                              color:
                                  AppColors.success,
                            ),

                            _MetricCard(
                              icon:
                                  Icons.warning,
                              title:
                                  'Abandonos',
                              value:
                                  '${dashboard.dashboard?.abandonos ?? 0}',
                              color:
                                  AppColors.warning,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        const Text(
                          'Estado del Sistema',
                          style:
                              TextStyle(
                            fontSize:
                                22,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Card(
                          child: Padding(
                            padding:
                                const EdgeInsets
                                    .all(
                              20,
                            ),

                            child: Column(
                              children: [

                                _StatusRow(
                                  'Válidos',
                                  dashboard
                                          .dashboard
                                          ?.validos ??
                                      0,
                                  AppColors.success,
                                ),

                                _StatusRow(
                                  'Rechazados',
                                  dashboard
                                          .dashboard
                                          ?.rechazados ??
                                      0,
                                  AppColors.danger,
                                ),

                                _StatusRow(
                                  'Porcentaje Global',
                                  '${dashboard.dashboard?.porcentajeGlobal ?? 0}%',
                                  AppColors.primary,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        const Text(
                          'Accesos Rápidos',
                          style:
                              TextStyle(
                            fontSize:
                                22,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Row(
                          children: [

                            Expanded(
                              child:
                                  _QuickAction(
                                icon:
                                    Icons
                                        .fingerprint,

                                title:
                                    'Asistencia',

                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) =>
                                              const AsistenciaScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(
                              width: 12,
                            ),

                            Expanded(
                              child:
                                  _QuickAction(
                                icon:
                                    Icons
                                        .schedule,

                                title:
                                    'Horarios',

                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) =>
                                              const HorariosScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        SizedBox(
                          width:
                              double.infinity,

                          height: 60,

                          child:
                              ElevatedButton.icon(
                            icon:
                                const Icon(
                              Icons
                                  .fingerprint,
                            ),

                            label:
                                const Text(
                              'REGISTRAR ASISTENCIA',
                            ),

                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) =>
                                          const AsistenciaScreen(),
                                ),
                              );
                            },
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
class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _MetricCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 34,
              color: color,
            ),
            const SizedBox(height: 10),
            Text(title),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  final String label;
  final dynamic value;
  final Color color;

  const _StatusRow(
    this.label,
    this.value,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 6,
            backgroundColor: color,
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(label)),
          Text(
            value.toString(),
            style: const TextStyle(
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:
          BorderRadius.circular(20),
      onTap: onTap,
      child: Card(
        child: Padding(
          padding:
              const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                icon,
                size: 36,
                color:
                    AppColors.primary,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style:
                    const TextStyle(
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}