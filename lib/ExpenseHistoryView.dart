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
  const ExpenseHistoryView({Key? key}) : super(key: key);

  @override
  _ExpenseHistoryViewState createState() => _ExpenseHistoryViewState();
}

class _ExpenseHistoryViewState extends State<ExpenseHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense History'),
      ),
      // body: // TODOS LOS EXPENSE SE DEBEN MOSTRAR EN UNA LISTVIEW
    );
  }
}
