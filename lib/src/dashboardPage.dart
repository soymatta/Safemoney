// DEPENDENCIAS
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// PAGINAS
import 'addExpensePage.dart';
import 'addIncomePage.dart';
import 'expenseLogs.dart';
import 'incomeLogs.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = 'Dashboard';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _currency = 'Select an option';
  int _balance = 0;
  int temBalance = 0;

  Future<void> _loadBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _balance = prefs.getInt('balance') ?? 0;
    });
  }

  Future<void> _loadCurrency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currency = prefs.getString('currency') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    _loadBalance();
    _loadCurrency();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff7DE494), Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your dashboard',
                    style: GoogleFonts.rubik(
                      color: const Color(0xFF57636C),
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Column(
                children: [
                  Text(
                    'Total balance',
                    style: GoogleFonts.rubik(
                      color: const Color(0xFF57636C),
                      fontWeight: FontWeight.w800,
                      fontSize: 32,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$_currency   ",
                        style: GoogleFonts.rubik(
                          color: const Color(0xFF57636C),
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "$_balance ",
                        style: GoogleFonts.rubik(
                          color: const Color(0xFF57636C),
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(30),
              height: 425,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddIncomePage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 35.0, horizontal: 5.0),
                          height: 165,
                          width: 140,
                          decoration: BoxDecoration(
                            color: const Color(0xffA3F2B4),
                            border: const Border(
                              top: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                              bottom: BorderSide(
                                  width: 4, color: Color(0xff559964)),
                              left: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                              right: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/imgs/ingreso.png',
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Add income",
                                  style: GoogleFonts.rubik(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddExpensePage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 35.0, horizontal: 5.0),
                          height: 165,
                          width: 140,
                          decoration: BoxDecoration(
                            color: const Color(0xffA3F2B4),
                            border: const Border(
                              top: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                              bottom: BorderSide(
                                  width: 4, color: Color(0xff559964)),
                              left: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                              right: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/imgs/gastos.png',
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Add expense",
                                  style: GoogleFonts.rubik(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IncomeLogs(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 35.0, horizontal: 5.0),
                          height: 165,
                          width: 140,
                          decoration: BoxDecoration(
                            color: const Color(0xffA3F2B4),
                            border: const Border(
                              top: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                              bottom: BorderSide(
                                  width: 4, color: Color(0xff559964)),
                              left: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                              right: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/imgs/dinero.png',
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Your incomes",
                                  style: GoogleFonts.rubik(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExpenseLogs(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 35.0, horizontal: 5.0),
                          height: 165,
                          width: 140,
                          decoration: BoxDecoration(
                            color: const Color(0xffA3F2B4),
                            border: const Border(
                              top: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                              bottom: BorderSide(
                                  width: 4, color: Color(0xff559964)),
                              left: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                              right: BorderSide(
                                  width: 2, color: Color(0xff559964)),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/imgs/calculo.png',
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Your expenses",
                                  style: GoogleFonts.rubik(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
