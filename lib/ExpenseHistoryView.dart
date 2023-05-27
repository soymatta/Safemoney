import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseHistoryView extends StatefulWidget {
  const ExpenseHistoryView({super.key, required this.title});

  final String title;

  @override
  State<ExpenseHistoryView> createState() => _ExpenseHistoryViewState();
}

class _ExpenseHistoryViewState extends State<ExpenseHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expemnse Logs',
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
          children: [],
        ),
      ),
    );
  }
}
