import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safemoney/AddExpenseView.dart';
import 'package:safemoney/AddIncomeView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SettingsView.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';

// Advanced segment
enum Segment {
  all,
  starred,
}
// Advanced segment

class HomePage extends StatefulWidget {
  static const String routeName = 'Dashboard';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currency = "Select an option..."; // Valor inicial mientras se carga
  String balance = '';

  final _widgetOptions = <Widget>[
    Text(
      'Widget 1',
    ),
    Text(
      'Widget 2',
    ),
  ];

  // Advanced segment
  final _selectedSegment = ValueNotifier(Segment.all);
  // Advanced segment
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
      balance = prefs.getString('balance') ?? '';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green,
                      Color.fromARGB(255, 100, 175, 100),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 200,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Balance',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        '$currency   ',
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        balance,
                        style: GoogleFonts.openSans(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddIncomeView()),
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 135, 255, 135),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              height: 70,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Center(
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Add income',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Icon(
                                        Icons.arrow_upward,
                                        color: Colors.green,
                                        size: 15,
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddExpenseView()),
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 135, 255, 135),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              height: 70,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Center(
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Add expense',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Icon(
                                        Icons.arrow_downward,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              AdvancedSegment(
                controller: _selectedSegment,
                segments: {
                  Segment.all: 'Income',
                  Segment.starred: 'Expense',
                },
                activeStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                inactiveStyle: TextStyle(
                  color: Colors.white54,
                ),
                backgroundColor: const Color(0xFF43E576),
                sliderColor: Colors.green,
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    kBottomNavigationBarHeight -
                    270,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ValueListenableBuilder<Segment>(
                      valueListenable: _selectedSegment,
                      builder: (context, value, child) {
                        return Center(child: _widgetOptions[value.index]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
