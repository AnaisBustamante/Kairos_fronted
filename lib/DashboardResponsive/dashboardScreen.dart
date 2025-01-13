import 'package:flutter/material.dart';
import 'package:kairos_fronted/DashboardResponsive/components/custom_drawer.dart';
import 'package:kairos_fronted/DashboardResponsive/utils.dart';

class DashboardResponsive extends StatefulWidget {
  const DashboardResponsive({super.key});

  @override
  _DashboardResponsiveState createState() => _DashboardResponsiveState();
}

class _DashboardResponsiveState extends State<DashboardResponsive> {
  int _selectedMenuIndex = 0; // Default to "Inicio"
  final String userRole =
      "Administrador"; // Cambiar a "Empleado" para probar con ese rol.

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLargeScreen = constraints.maxWidth >= 900;

        return Scaffold(
          appBar: !isLargeScreen
              ? AppBar(
                  title: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Sidecom - Kairos",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'MohrRoundedAlt',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "Urb. Bellamar Mz.A Lt.45 - Nuevo Chimbote",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'MohrRoundedAlt',
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: MyAppColor.pink10Color,
                  elevation: 0,
                )
              : null,
          body: Container(
            color: MyAppColor
                .backgroundColor, // Aquí asignas el color de fondo que desees
            child: Row(
              children: [
                if (isLargeScreen)
                  CustomDrawer(
                    selectedIndex: _selectedMenuIndex,
                    onMenuItemSelected: (index) {
                      setState(() {
                        _selectedMenuIndex = index;
                      });
                    },
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isLargeScreen)
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: MyAppColor.pink10Color,
                            border: Border(
                              bottom: BorderSide(
                                color: MyAppColor.grayColor,
                                width: 0.5,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Sidecom - Kairos",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'MohrRoundedAlt',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                "Urb. Bellamar Mz.A Lt.45 - Nuevo Chimbote",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'MohrRoundedAlt',
                                ),
                              ),
                            ],
                          ),
                        ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: LayoutBuilder(
                              builder: (context, innerConstraints) {
                                List<Widget> contentWidgets = [];

                                if (_selectedMenuIndex == 0) {
                                  contentWidgets = [
                                    Container(
                                        padding: const EdgeInsets.all(16.0),
                                        width: innerConstraints.maxWidth,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Resumen General",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontFamily: 'MohrRoundedAlt',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 30.0),
                                              // Tarjetas de Resumen
                                              LayoutBuilder(
                                                builder:
                                                    (context, constraints) {
                                                  return Wrap(
                                                    spacing: 16.0,
                                                    runSpacing: 16.0,
                                                    children: [
                                                      _buildSummaryCard(
                                                          "Ventas del Día",
                                                          "S/ 500.00"),
                                                      _buildSummaryCard(
                                                          "Ventas Semanales",
                                                          "S/ 1,000.00"),
                                                      _buildSummaryCard(
                                                          "Ventas Mensuales",
                                                          "S/ 5,000.00"),
                                                    ],
                                                  );
                                                },
                                              ),
                                              const SizedBox(height: 30.0),
                                              LayoutBuilder(
                                                builder:
                                                    (context, constraints) {
                                                  bool isWideEnough = constraints
                                                          .maxWidth >
                                                      600; // Ajusta el valor según el tamaño necesario para estar en una fila

                                                  return isWideEnough
                                                      ? Row(
                                                        
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  _buildInfoCard(
                                                                title:
                                                                    "Productos más Vendidos",
                                                                content:
                                                                    const Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            "Productos",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              fontFamily: 'MohrRoundedAlt',
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Text(
                                                                            "Unidades",
                                                                            textAlign:
                                                                                TextAlign.right,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              fontFamily: 'MohrRoundedAlt',
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            4.0),
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            "Cremolada de Fresa",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16,
                                                                              fontFamily: 'MohrRoundedAlt',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Text(
                                                                            "10",
                                                                            textAlign:
                                                                                TextAlign.right,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16,
                                                                              fontFamily: 'MohrRoundedAlt',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(width: 20),
                                                            Expanded(
                                                              child:
                                                                  _buildInfoCard(
                                                                title:
                                                                    "Sedes Top",
                                                                content:
                                                                    const Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            "Sedes",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              fontFamily: 'MohrRoundedAlt',
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Text(
                                                                            "Total S/.",
                                                                            textAlign:
                                                                                TextAlign.right,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              fontFamily: 'MohrRoundedAlt',
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            4.0),
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            "Sidecom - Kairos:",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              fontFamily: 'MohrRoundedAlt',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Text(
                                                                            "20.00",
                                                                            textAlign:
                                                                                TextAlign.right,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              fontFamily: 'MohrRoundedAlt',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Wrap(
                                                          spacing: 16.0,
                                                          runSpacing: 16.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          children: [
                                                            _buildInfoCard(
                                                              title:
                                                                  "Productos más Vendidos",
                                                              content:
                                                                  const Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          "Productos",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontFamily:
                                                                                'MohrRoundedAlt',
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "Unidades",
                                                                          textAlign:
                                                                              TextAlign.right,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontFamily:
                                                                                'MohrRoundedAlt',
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          4.0),
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          "Cremolada de Fresa",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontFamily:
                                                                                'MohrRoundedAlt',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "10",
                                                                          textAlign:
                                                                              TextAlign.right,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontFamily:
                                                                                'MohrRoundedAlt',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            _buildInfoCard(
                                                              title:
                                                                  "Sedes Top",
                                                              content:
                                                                  const Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          "Sedes",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontFamily:
                                                                                'MohrRoundedAlt',
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "Total S/.",
                                                                          textAlign:
                                                                              TextAlign.right,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontFamily:
                                                                                'MohrRoundedAlt',
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          4.0),
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          "Sidecom - Kairos:",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontFamily:
                                                                                'MohrRoundedAlt',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "20.00",
                                                                          textAlign:
                                                                              TextAlign.right,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontFamily:
                                                                                'MohrRoundedAlt',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                },
                                              ),

                                              const SizedBox(height: 30.0),

                                              // Notificaciones
                                              _buildNotificationCard(
                                                "\u26A0 Stock bajo de Cremolada de Fresa en la Sede Sidecom",
                                              ),
                                            ]))
                                  ];
                                } else {
                                  contentWidgets = [
                                    Text(
                                      "Selected Menu: ${_selectedMenuIndex == 1 ? 'Usuarios' : 'Sedes'}",
                                    ),
                                  ];
                                }

                                return GridView.extent(
                                    maxCrossAxisExtent: constraints.maxWidth,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: 1.5,
                                    children: contentWidgets);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          drawer: isLargeScreen
              ? null
              : CustomDrawer(
                  selectedIndex: _selectedMenuIndex,
                  onMenuItemSelected: (index) {
                    setState(() {
                      _selectedMenuIndex = index;
                    });
                  },
                ),
        );
      },
    );
  }
}

Widget _buildSummaryCard(String title, String value) {
  return Container(
    padding: const EdgeInsets.all(25.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: 'MohrRoundedAlt',
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'MohrRoundedAlt',
            fontWeight: FontWeight.bold,
            color: MyAppColor.primaryPinkColor,
          ),
        ),
      ],
    ),
  );
}

Widget _buildInfoCard({required String title, required Widget content}) {
  return Container(
    padding: const EdgeInsets.all(25.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'MohrRoundedAlt'),
        ),
        const SizedBox(height: 8.0),
        content,
      ],
    ),
  );
}

Widget _buildNotificationCard(String message) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.red.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        //const Icon(Icons.warning, color: Colors.red),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'MohrRoundedAlt'),
          ),
        ),
      ],
    ),
  );
}
