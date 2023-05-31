import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safemoney/ExpenseHistoryView.dart';
import 'package:safemoney/IncomeHistoryView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsView extends StatefulWidget {
  static const String routeName = 'Settings';

  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late SharedPreferences _prefs;
  late String _currency;

  @override
  void initState() {
    super.initState();
    loadCurrency();
  }

  Future<void> loadCurrency() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _currency = _prefs.getString('currency') ?? 'Select an option...';
    });
  }

  Future<void> saveCurrency(String newCurrency) async {
    setState(() {
      _currency = newCurrency;
    });
    await _prefs.setString('currency', newCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.openSans(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF43E576),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current currency:',
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            DropdownButton<String>(
              value: _currency,
              onChanged: (String? newValue) {
                setState(() {
                  _currency = newValue!;
                });

                if (_currency == 'Select an option...') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Invalid selection'),
                        content: const Text('Please select a different option.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Guardar el valor seleccionado en shared_preferences
                  saveCurrency(newValue!);
                }
              },
              items: <String>[
                'Select an option...',
                'EUR - Euro',
                'COP - Colombian Peso',
                'USD - United States Dollar'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IncomeHistoryView(),
                  ),
                );
              },
              child: Text(
                'Income Log  ',
                style: GoogleFonts.openSans(
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExpenseHistoryView(),
                  ),
                );
              },
              child: Text(
                'Expense Log  ',
                style: GoogleFonts.openSans(
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2.0,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm'),
                      content:
                          const Text('Are you sure you want to delete all data?'),
                      actions: [
                        TextButton(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Clear All Data',
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
