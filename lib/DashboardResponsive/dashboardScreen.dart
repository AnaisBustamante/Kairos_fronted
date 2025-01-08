import 'package:flutter/material.dart';
import 'package:kairos_fronted/DashboardResponsive/components/category_card.dart';
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
      "Administrador"; // Cambiar a "Administrador" para probar con ese rol.

  // Método para obtener los CategoryCards en función del rol de usuario
  List<Widget> _getCategoryCards() {
    if (userRole == "Empleado") {
      return [
        const CategoryCard(
          icon: Icons.local_drink,
          color: MyAppColor.primaryOrangeColor,
          title: "Cremoladas",
          subtitle: "Inventario y Gestión de tus cremoladas",
        ),
        const CategoryCard(
          icon: Icons.receipt,
          color: MyAppColor.primarygreenColor,
          title: "Ventas",
          subtitle: "Administra tus ventas",
        ),
      ];
    } else {
      return [
        const CategoryCard(
          icon: Icons.person,
          color: MyAppColor.primaryFucsiaColor,
          title: "Usuarios",
          subtitle: "Administra tus Usuarios",
        ),
        const CategoryCard(
          icon: Icons.location_city,
          color: MyAppColor.primaryTurquezaColor,
          title: "Sedes",
          subtitle: "Administra tus Sedes",
        ),
        const CategoryCard(
          icon: Icons.local_drink,
          color: MyAppColor.primaryOrangeColor,
          title: "Cremoladas",
          subtitle: "Inventario y Gestión de tus cremoladas",
        ),
        const CategoryCard(
          icon: Icons.receipt,
          color: MyAppColor.primarygreenColor,
          title: "Ventas",
          subtitle: "Administra tus ventas",
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
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
        backgroundColor: MyAppColor.pink10Color,
        elevation: 0,
        toolbarHeight: null,
      ),
      drawer: CustomDrawer(
        selectedIndex: _selectedMenuIndex,
        onMenuItemSelected: (index) {
          setState(() {
            _selectedMenuIndex = index;
          });
        },
      ),
      backgroundColor: MyAppColor.backgroundColor,
      body: Center( // Aquí usamos un Center para centrar el contenido
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxExtent;

            if (constraints.maxWidth > 1200) {
              maxExtent = 200; // Para pantallas grandes
            } else if (constraints.maxWidth > 600) {
              maxExtent = 250; // Para pantallas medianas
            } else {
              maxExtent = 300; // Para pantallas pequeñas
            }

            List<Widget> contentWidgets = [];

            if (_selectedMenuIndex == 0) {
              // Default view for "Inicio"
              contentWidgets.addAll(_getCategoryCards());
            } else {
              contentWidgets = [
                Text(
                  "Selected Menu: ${_selectedMenuIndex == 1 ? 'Usuarios' : 'Sedes'}",
                ),
              ];
            }

            /*return GridView.count(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: contentWidgets,
            );*/
            return GridView.extent(
              maxCrossAxisExtent: maxExtent, // Ancho máximo de cada tarjeta
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: contentWidgets,
            );
          },
        ),
      ),
      ),
    );
  }
}
