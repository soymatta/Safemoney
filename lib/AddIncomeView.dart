// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Income {
  String name;
  double amount;

  Income({
    required this.name,
    required this.amount,
  });
}

class AddIncomeView extends StatefulWidget {
  const AddIncomeView({Key? key}) : super(key: key);

  @override
  _AddIncomeViewState createState() => _AddIncomeViewState();
}

class _AddIncomeViewState extends State<AddIncomeView> {

 String incomeName = '';
  int incomeAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Income'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: 
      ),
    );
  }

}
