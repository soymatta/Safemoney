// DEPENDENCIAS
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

// PAGINAS
import 'dashboardPage.dart';

class SetBalancePage extends StatefulWidget {
  static const routeName = 'SetBalance';

  const SetBalancePage({Key? key}) : super(key: key);

  @override
  _SetBalancePageState createState() => _SetBalancePageState();
}

class _SetBalancePageState extends State<SetBalancePage> {
  int _balance = 0;

  final TextEditingController _textControllerDigit = TextEditingController();

  @override
  void dispose() {
    _textControllerDigit.dispose();
    super.dispose();
  }

  Future<void> _saveBalance(int balance) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('balance', balance);
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
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(),
              Column(
                children: [
                  Image.asset(
                    'assets/imgs/dollar.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Set up your balance',
                    style: GoogleFonts.rubik(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _textControllerDigit,
                    decoration: const InputDecoration(
                        labelText: "Enter your current balance"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (newvalue) {
                      setState(() {
                        _balance = int.parse(newvalue);
                        _saveBalance(_balance);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'This is the balance that will be displayed on your dashboard, after this moment it cannot be changed.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        fontSize: 16, color: const Color(0xff57636c)),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA3F2B4),
                    borderRadius: BorderRadius.circular(10),
                    border: const Border(
                      top: BorderSide(width: 2, color: Color(0xFF559964)),
                      bottom: BorderSide(width: 4, color: Color(0xFF559964)),
                      left: BorderSide(width: 2, color: Color(0xFF559964)),
                      right: BorderSide(width: 2, color: Color(0xFF559964)),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Next!',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
