// DEPENDENCIAS
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safemoney/src/addIncomePage.dart';
import 'package:safemoney/src/dashboardPage.dart';
import 'package:safemoney/src/setCurrencyPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// PAGINAS
import 'src/welcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      initialRoute: WelcomePage.routeName,
      routes: {
        WelcomePage.routeName: (context) => const WelcomePage(),
        SetCurrencyPage.routeName: (context) => const SetCurrencyPage(),
        DashboardPage.routeName: (context) => const DashboardPage(),
        AddIncomePage.routeName: (context) => const AddIncomePage(),
      },
    );
  }
}

// Funciones del shared preferences
Future<void> saveData(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}
