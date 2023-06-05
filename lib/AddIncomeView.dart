// ignore_for_file: file_names

import 'package:flutter/material.dart';
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
  static const String routeName = 'Add a new Income';

  const AddIncomeView({super.key});

  @override
  _AddIncomeViewState createState() => _AddIncomeViewState();
}

class _AddIncomeViewState extends State<AddIncomeView> {
  String incomeName = '';
  int incomeAmount = 0;

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Income'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Name of income',
            ),
            onChanged: (value) {
              setState(() {
                incomeName = value;
              });
            },
          ),
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Amount of money',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {
              setState(() {
                incomeAmount = int.parse(value);
              });
            },
          ),
        ]),
      ),
    );
  }
}
