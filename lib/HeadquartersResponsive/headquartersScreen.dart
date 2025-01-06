import 'package:flutter/material.dart';
import 'package:kairos_fronted/HeadquartersResponsive/utils.dart';

class HeadquartersScreen extends StatefulWidget {
  const HeadquartersScreen({super.key});

  @override
  State<HeadquartersScreen> createState() => _HeadquartersScreenState();
}

class _HeadquartersScreenState extends State<HeadquartersScreen> {
  @override
  Widget build(BuildContext context) {
    // Obtener tamaño de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;

    // Definir el diseño responsive
    final isMobile = screenWidth < 600;

    return Scaffold(
      body: Stack(
        children: [
          // Fondo con imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          SafeArea(
            child: Column(
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                  ),
                ),
                const Align(
                  alignment:
                      Alignment.centerLeft, // Alinea el texto a la izquierda
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Sedes',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'MohrRounded',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Tarjetas de sedes
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Definir el número de columnas y porcentaje de altura dinámico
                      final int crossAxisCount;
                      final double cardHeightPercentage;

                      if (constraints.maxWidth < 400) {
                        // Caso móvil
                        crossAxisCount = 1;
                        cardHeightPercentage =
                            0.4; // 40% de la altura disponible
                      }
                      else if (constraints.maxWidth < 600) {
                        // Caso móvil
                        crossAxisCount = 1;
                        cardHeightPercentage =
                            0.4; // 40% de la altura disponible
                      /*}  else if (constraints.maxWidth < 900) {
                        // Caso móvil
                        crossAxisCount = 2;
                        cardHeightPercentage =
                            0.4; // 50% de la altura disponible*/
                      }else if (constraints.maxWidth < 1200) {
                        // Pantallas medianas (< 1200px)
                        crossAxisCount = 2; // Ajusta a 2 columnas
                        cardHeightPercentage =
                            0.4; // 30% de la altura disponible
                      } else if (constraints.maxWidth < 1400) {
                        // Pantallas grandes (1200px <= ancho < 1450px)
                        crossAxisCount = 3; // Ajusta a 3 columnas
                        cardHeightPercentage =
                            0.4; // 25% de la altura disponible
                      } else if (constraints.maxWidth < 1600) {
                        // Pantallas grandes (1200px <= ancho < 1450px)
                        crossAxisCount = 4; // Ajusta a 3 columnas
                        cardHeightPercentage =
                            0.4; // 25% de la altura disponible
                      }else {
                        crossAxisCount = 4; // Ajusta a 4 columnas
                        cardHeightPercentage =
                            0.35; // 20% de la altura disponible
                      }

                      final double cardHeight =
                          constraints.maxHeight * cardHeightPercentage;

                      return GridView.builder(
                        padding: const EdgeInsets.all(20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              crossAxisCount, // Número dinámico de columnas
                          crossAxisSpacing: 20, // Espaciado entre columnas
                          mainAxisSpacing: 20, // Espaciado entre filas
                          mainAxisExtent:
                              cardHeight, // Altura dinámica basada en el porcentaje
                        ),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          // Datos de ejemplo
                          final List<Map<String, dynamic>> headquarters = [
                            {
                              "title": "Sidecom - Kairos",
                              "address":
                                  "Urb.Bellamar Mz.A Lt.45 - Nuevo Chimbote",
                              "status": "Operativo",
                            },
                            {
                              "title": "Ovalo de la Familia - Kairos",
                              "address":
                                  "Urb.Bellamar Mz.A Lt.45 - Nuevo Chimbote",
                              "status": "Inoperativo",
                            },
                          ];

                          final String title =
                              headquarters[index]['title'] as String;
                          final String address =
                              headquarters[index]['address'] as String;
                          final String status =
                              headquarters[index]['status'] as String;

                          // Colores según el estado
                          Color statusColor;
                          Color borderColor;

                          if (status == "Operativo") {
                            statusColor = MyAppColor.green30Color;
                            borderColor = MyAppColor.primarygreenColor;
                          } else {
                            statusColor = MyAppColor.yellow30Color;
                            borderColor = MyAppColor.primaryOrangeColor;
                          }

                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: Color.fromARGB(
                                    151, 67, 67, 67), // Color del borde
                                width: 0.5, // Ancho del borde
                              ),
                            ),
                            elevation: 6,
                            color: MyAppColor.whiteColor,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight:
                                    cardHeight, // Usa el porcentaje calculado
                                maxHeight:
                                    cardHeight, // Usa el porcentaje calculado
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Encabezado rosado con título
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: MyAppColor.pink10Color,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                      border: Border(
                                        bottom: BorderSide(
                                          color:
                                              Color.fromARGB(151, 67, 67, 67),
                                          width: 0.5,
                                        ),
                                      ),
                                    ),
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'MohrRoundedAlt',
                                        fontWeight: FontWeight.w600,
                                        color: MyAppColor.blackColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Dirección
                                        Row(
                                          children: [
                                            const Icon(Icons.location_on,
                                                color: MyAppColor
                                                    .primaryFucsiaColor),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: Text(
                                                address,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'MohrRoundedAlt',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        // Estado
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 20.0),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: statusColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              color: borderColor,
                                              width: 1,
                                            ),
                                          ),
                                          child: Text(
                                            status,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: MyAppColor.blackColor,
                                              fontFamily: 'MohrRoundedAlt',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        // Botón de ingresar
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  MyAppColor.pink80Color,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              // Acción al presionar el botón
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                  vertical: 6.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Ingresar',
                                                    style: TextStyle(
                                                      color:
                                                          MyAppColor.whiteColor,
                                                      fontFamily:
                                                          'MohrRoundedAlt',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(width: 8),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    color:
                                                        MyAppColor.whiteColor,
                                                  ),
                                                ],
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
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
