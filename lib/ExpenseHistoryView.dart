// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Expense {
  String name;
  double amount;

  Expense({
    required this.name,
    required this.amount,
  });
}

class ExpenseHistoryView extends StatefulWidget {
  static const String routeName = 'Expense logs';

  const ExpenseHistoryView({super.key});

  @override
  _ExpenseHistoryViewState createState() => _ExpenseHistoryViewState();
}

class _ExpenseHistoryViewState extends State<ExpenseHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense History'),
      ),
      // body: // TODOS LOS EXPENSE SE DEBEN MOSTRAR EN UNA LISTVIEW
    );
  }
}
