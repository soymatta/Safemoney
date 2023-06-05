// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Income {
  String name;
  double amount;

  Income({
    required this.name,
    required this.amount,
  });
}

class IncomeHistoryView extends StatefulWidget {
  static const String routeName = 'Income logs';

  const IncomeHistoryView({super.key});

  @override
  _IncomeHistoryViewState createState() => _IncomeHistoryViewState();
}

class _IncomeHistoryViewState extends State<IncomeHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Income History'),
      ),
      // body: // TODOS LOS INCOME SE DEBEN MOSTRAR EN UNA LISTVIEW
    );
  }
}
