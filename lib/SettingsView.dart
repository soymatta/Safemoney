import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safemoney/ExpenseHistoryView.dart';
import 'package:safemoney/IncomeHistoryView.dart';
import 'main.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key, required this.title});

  final String title;

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
        backgroundColor: Color(0xFF43E576),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
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
              value: MyApp.currency,
              onChanged: (String? newValue) {
                setState(() {
                  MyApp.currency = newValue!;
                });
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
            Divider(
              color: Colors.grey,
              thickness: 2.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IncomeHistoryView(
                      title: 'IncomeHistoryView',
                    ),
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
                    builder: (context) => ExpenseHistoryView(
                      title: 'ExpenseHistoryView',
                    ),
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
            Divider(
              color: Colors.grey,
              thickness: 2.0,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm'),
                      content:
                          Text('Are you sure you want to delete all data?'),
                      actions: [
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Yes'),
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
