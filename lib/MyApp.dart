import 'package:flutter/material.dart';
import 'MyHomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SafeMoney',
      theme: ThemeData(       
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF43E576)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SafeMoney welcome page'),
    );
  }
}
