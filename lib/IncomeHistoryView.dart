import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IncomeHistoryView extends StatefulWidget {
  static const String routeName = 'Incomes';

  const IncomeHistoryView({super.key});

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
        backgroundColor: const Color(0xFF43E576),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
