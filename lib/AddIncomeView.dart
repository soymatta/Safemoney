import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Income {
  String type;
  double amount;

  Income({
    required this.type,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'amount': amount,
    };
  }

  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
      type: json['type'],
      amount: json['amount'],
    );
  }
}

class AddIncomeView extends StatefulWidget {
  const AddIncomeView({Key? key}) : super(key: key);

  @override
  _AddIncomeViewState createState() => _AddIncomeViewState();
}

class _AddIncomeViewState extends State<AddIncomeView> {
  final _formKey = GlobalKey<FormState>();
  final _typeController = TextEditingController();
  final _amountController = TextEditingController();

  void _addIncome() async {
    if (_formKey.currentState!.validate()) {
      final type = _typeController.text;
      final amount = double.parse(_amountController.text);

      // Crear una nueva instancia de ingreso
      final newIncome = Income(
        type: type,
        amount: amount,
      );

      // Obtener la lista de ingresos actual de shared_preferences
      final prefs = await SharedPreferences.getInstance();
      final existingIncomes = prefs.getStringList('incomes');

      // Crear una nueva lista con el ingreso añadido
      List<Income> updatedIncomes = [];
      if (existingIncomes != null) {
        updatedIncomes = existingIncomes
            .map((income) => Income.fromJson(jsonDecode(income)))
            .toList();
      }
      updatedIncomes.add(newIncome);

      // Guardar la lista de ingresos actualizada en shared_preferences
      final encodedIncomes =
          updatedIncomes.map((income) => jsonEncode(income.toJson())).toList();
      await prefs.setStringList('incomes', encodedIncomes);

      // Mostrar una notificación
      showNotification('Income added successfully');

      // Limpiar los campos del formulario
      _typeController.clear();
      _amountController.clear();
    }
  }

  @override
  void dispose() {
    _typeController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Income'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Type of Income'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the type of income';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addIncome,
                child: Text('Add Income'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void showNotification(String s) {}
}
