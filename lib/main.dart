import 'package:flutter/material.dart';
import 'package:kairos_fronted/DashboardResponsive/dashboardScreen.dart';
import 'package:kairos_fronted/DashboardResponsive/utils.dart';
import 'package:kairos_fronted/HeadquartersResponsive/headquartersScreen.dart';
import 'package:kairos_fronted/LoginResponsive/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyAppColor.primaryPinkColor,
      ),
      home: const DashboardResponsive(),
      //const LoginScreen(),
      //const HeadquartersScreen()
    );
  }
}
