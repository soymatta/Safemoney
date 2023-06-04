import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Expense {
  String type;
  double amount;
  int frequency;

  Expense({
    required this.type,
    required this.amount,
    required this.frequency,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      type: json['type'],
      amount: json['amount'],
      frequency: json['frequency'],
    );
  }
}

class ExpenseHistoryView extends StatefulWidget {
  const ExpenseHistoryView({Key? key}) : super(key: key);

  @override
  _ExpenseHistoryViewState createState() => _ExpenseHistoryViewState();
}

class _ExpenseHistoryViewState extends State<ExpenseHistoryView> {
  List<Expense> expenses = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  void _loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedExpenses = prefs.getStringList('expenses');

    if (encodedExpenses != null) {
      setState(() {
        expenses = encodedExpenses
            .map((expense) => Expense.fromJson(jsonDecode(expense)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense History'),
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final income = expenses[index];
          return ListTile(
            title: Text(income.type),
            subtitle: Text('Amount: ${income.amount.toStringAsFixed(2)}'),
            trailing: Text('Frequency (Days): ${income.frequency}'),
          );
        },
      ),
    );
  }
}
