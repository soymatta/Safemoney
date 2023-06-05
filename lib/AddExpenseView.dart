// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Expense {
  String name;
  double amount;

  Expense({
    required this.name,
    required this.amount,
  });
}

class AddExpenseView extends StatefulWidget {
  static const String routeName = 'Add a new Expense';

  const AddExpenseView({super.key});

  @override
  _AddExpenseViewState createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  String expenseName = '';
  int expenseAmount = 0;

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textControllerDigit = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
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
                expenseName = value;
              });
            },
          ),
          TextField(
            controller: _textControllerDigit,
            decoration: const InputDecoration(
              labelText: 'Amount of money',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {
              setState(() {
                expenseAmount = int.parse(value);
              });
            },
          ),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              suffixIcon: _searchController.text.isEmpty
                  ? null
                  : InkWell(
                      onTap: () => _searchController.clear(),
                      child: Icon(Icons.clear),
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
