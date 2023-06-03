ubeiimport 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Income {
  String type;
  double amount;
  int frequency;

  Income({
    required this.type,
    required this.amount,
    required this.frequency,
  });

  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
      type: json['type'],
      amount: json['amount'],
      frequency: json['frequency'],
    );
  }
}

class IncomeHistoryView extends StatefulWidget {
  const IncomeHistoryView({Key? key}) : super(key: key);

  @override
  _IncomeHistoryViewState createState() => _IncomeHistoryViewState();
}

class _IncomeHistoryViewState extends State<IncomeHistoryView> {
  List<Income> incomes = [];

  @override
  void initState() {
    super.initState();
    _loadIncomes();
  }

  void _loadIncomes() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedIncomes = prefs.getStringList('incomes');

    if (encodedIncomes != null) {
      setState(() {
        incomes = encodedIncomes
            .map((income) => Income.fromJson(jsonDecode(income)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income History'),
      ),
      body: ListView.builder(
        itemCount: incomes.length,
        itemBuilder: (context, index) {
          final income = incomes[index];
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
