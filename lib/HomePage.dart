import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safemoney/AddExpenseView.dart';
import 'package:safemoney/AddIncomeView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SettingsView.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'Dashboard';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currency = "Select an option..."; // Valor inicial mientras se carga
  String Balance = '';

  @override
  void initState() {
    super.initState();
    loadCurrency();
    loadBalance();
  }

  Future<void> loadCurrency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currency = prefs.getString('currency') ?? 'Select an option...';
    });
  }

  Future<void> loadBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Balance = prefs.getString('balance') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: GoogleFonts.openSans(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF43E576),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsView(),
                ),
              ).then((_) {
                // Actualizar el valor de currency después de regresar de SettingsView
                loadCurrency();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Balance: $Balance',
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              'Currency: $currency', // Usar el valor de currency
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddExpenseView(),
                  ),
                );
              },
              child: const Icon(Icons.attach_money),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddIncomeView(),
                  ),
                );
              },
              child: const Icon(Icons.attach_money),
            ),
          ],
        ),
      ),
    );
  }
}
