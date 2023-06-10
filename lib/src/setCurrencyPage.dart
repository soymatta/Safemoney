// DEPENDENCIAS
import 'package:status_alert/status_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// PAGINAS
import 'setBalancePage.dart';

const List<String> currencyList = ['Select an option...', 'COP', 'EUR', 'USD'];

class SetCurrencyPage extends StatefulWidget {
  static const routeName = 'SelectCurrency';

  const SetCurrencyPage({Key? key}) : super(key: key);

  @override
  _SetCurrencyPageState createState() => _SetCurrencyPageState();
}

class _SetCurrencyPageState extends State<SetCurrencyPage> {
  String _currency = currencyList.first;

  Future<void> _saveCurrency(String currency) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('currency', currency);
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
                    'assets/imgs/currencys.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Select your currency',
                    style: GoogleFonts.rubik(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButton<String>(
                      value: _currency,
                      items: currencyList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _currency = value!;
                          _saveCurrency(value);
                        });
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'This is the currency that will be displayed on your dashboard, after this moment it cannot be changed.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        fontSize: 16, color: const Color(0xff57636c)),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (_currency == 'Select an option...') {
                    StatusAlert.show(
                      context,
                      duration: const Duration(seconds: 1),
                      title: 'Select a valid currency',
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SetBalancePage(),
                      ),
                    );
                  }
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
