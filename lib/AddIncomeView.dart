// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomePage.dart';

class Income {
  String name;
  double amount;

  Income({
    required this.name,
    required this.amount,
  });
}

class IncomeManager{

  static final IncomeManager _instance = IncomeManager._internal();

  factory IncomeManager() {
    return _instance;
  }

  IncomeManager._internal();

  List<Income> _incomes = [];

  List<Income> get incomes => _incomes;

  void addIncome(Income income) {
    _incomes.add(income);
  }

}

class AddIncomeView extends StatefulWidget {
  static const String routeName = 'Add a new Income';

  const AddIncomeView({super.key});

  @override
  _AddIncomeViewState createState() => _AddIncomeViewState();
}

class _AddIncomeViewState extends State<AddIncomeView> {
  String incomeName = '';
  double incomeAmount = 0;

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textControllerDigit = TextEditingController();

  void _addIncome(String Name, double amount){

    IncomeManager().addIncome(Income(name: incomeName, amount: incomeAmount));



    _textController.clear();
    _textControllerDigit.clear();
    
    print('works');

  }

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
                incomeAmount = double.parse(value);
              });
            },
          ),
          TextButton(onPressed: () {
            _addIncome(incomeName, incomeAmount);
            HomePage.total = HomePage.total + incomeAmount;
            print(HomePage.total);
            
          }, child: Text('Agregar Ingreso'))
        ]),
      ),
    );
  }
}
