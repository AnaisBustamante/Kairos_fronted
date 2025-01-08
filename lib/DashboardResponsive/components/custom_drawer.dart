import 'package:flutter/material.dart';
import 'package:kairos_fronted/DashboardResponsive/utils.dart';

class CustomDrawer extends StatefulWidget {
  final int selectedIndex; // Current selected index
  final Function(int) onMenuItemSelected; // Callback function to update selected menu item

  const CustomDrawer({super.key, required this.selectedIndex, required this.onMenuItemSelected});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 90,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMenuItem(0, Icons.home_rounded, 'Inicio'),
                  _buildMenuItem(1, Icons.person, 'Usuarios'),
                  _buildMenuItem(2, Icons.location_city, 'Sedes'),
                  _buildMenuItem(3, Icons.local_drink, 'Cremoladas'),
                  _buildMenuItem(4, Icons.receipt, 'Ventas'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(int index, IconData icon, String text) {
    final bool isSelected = widget.selectedIndex == index; // Compare with widget.selectedIndex

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: InkWell(
        onTap: () {
          widget.onMenuItemSelected(index); // Notify parent widget of the selected item
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isSelected ? MyAppColor.pink50Color : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? MyAppColor.primaryPinkColor : Colors.black,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'MohrRoundedAlt',
                    color: isSelected ? MyAppColor.primaryPinkColor : MyAppColor.blackColor,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 16, // Set your desired font size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
