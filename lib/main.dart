import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'WelcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // Variables globales
  static int balance = 0;
  static String currency = 'Select an option...';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SafeMoney',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
      ),
      home: const WelcomePage(title: 'SafeMoney welcome page'),
    );
  }
}
