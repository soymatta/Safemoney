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

class AddExpenseView extends StatefulWidget {
  const AddExpenseView({Key? key}) : super(key: key);

  @override
  _AddExpenseViewState createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
String expenseName = '';
  int expenseAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: 
      ),
    );
  }

}