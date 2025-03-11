import 'package:flutter/material.dart';
import 'package:workbee/verification/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workbee',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
