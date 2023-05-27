import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IncomeHistoryView extends StatefulWidget {
  const IncomeHistoryView({super.key, required this.title});

  final String title;

  @override
  State<IncomeHistoryView> createState() => _IncomeHistoryViewState();
}

class _IncomeHistoryViewState extends State<IncomeHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Income Logs',
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
