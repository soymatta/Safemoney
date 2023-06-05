import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safemoney/AddExpenseView.dart';
import 'package:safemoney/AddIncomeView.dart';
import 'package:safemoney/ExpenseHistoryView.dart';
import 'package:safemoney/HomePage.dart';
import 'package:safemoney/IncomeHistoryView.dart';
import 'package:safemoney/SettingsView.dart';
import 'WelcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      initialRoute: HomePage.routeName,
      routes: {
        WelcomePage.routeName: (context) => const WelcomePage(),
        HomePage.routeName: (context) => const HomePage(),
        SettingsView.routeName: (context) => const SettingsView(),
        AddExpenseView.routeName: (context) => const AddExpenseView(),
        AddIncomeView.routeName: (context) => const AddIncomeView(),
        ExpenseHistoryView.routeName: (context) => const ExpenseHistoryView(),
        IncomeHistoryView.routeName: (context) => const IncomeHistoryView(),
      },
    );
  }
}

// Funciones del shared preferences
Future<void> saveData(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String> loadData(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? '';
}
