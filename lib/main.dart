import 'package:docderm/screens/home_screen.dart';
import 'package:docderm/screens/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DocDerm',
      home: LandingScreen(),
    );
  }
}
