import 'package:flutter/material.dart';
import 'WelcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SafeMoney',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF43E576)),
        useMaterial3: true,
      ),
      home: const WelcomePage(title: 'SafeMoney welcome page'),
    );
  }
}
