import 'package:flutter/material.dart';
import 'package:kairos_fronted/LoginResponsive/loginScreen.dart';
import 'package:kairos_fronted/HeadquartersResponsive/HeadquartersScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeadquartersScreen(),
    );
  }
}
