import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Expense {
  String type;
  double amount;
  String date;

  Expense({
    required this.type,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'amount': amount,
      'date': date,
    };
  }

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      type: json['type'],
      amount: json['amount'],
      date: json['date'],
    );
  }
}

class AddExpenseView extends StatefulWidget {
  const AddExpenseView({Key? key}) : super(key: key);

  @override
  _AddExpenseViewState createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  final _formKey = GlobalKey<FormState>();
  final _typeController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  void _addExpense() async {
    if (_formKey.currentState!.validate()) {
      final type = _typeController.text;
      final amount = double.parse(_amountController.text);
      final date = _dateController.text;

      // Crear una nueva instancia de gasto
      final newExpense = Expense(
        type: type,
        amount: amount,
        date: date,
      );

      // Obtener la lista de gastos actual de shared_preferences
      final prefs = await SharedPreferences.getInstance();
      final existingExpenses = prefs.getStringList('expenses');

      // Crear una nueva lista con el gasto añadido
      List<Expense> updatedExpenses = [];
      if (existingExpenses != null) {
        updatedExpenses = existingExpenses
            .map((expense) => Expense.fromJson(jsonDecode(expense)))
            .toList();
      }
      updatedExpenses.add(newExpense);

      // Guardar la lista de gastos actualizada en shared_preferences
      final encodedExpenses = updatedExpenses
          .map((expense) => jsonEncode(expense.toJson()))
          .toList();
      await prefs.setStringList('expenses', encodedExpenses);

      // Mostrar una notificación
      showNotification('Expense added successfully');

      // Limpiar los campos del formulario
      _typeController.clear();
      _amountController.clear();
      _dateController.clear();
    }
  }

  @override
  void dispose() {
    _typeController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
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
                decoration: InputDecoration(labelText: 'Type of Expense'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the type of expense';
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
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the date';
                  }
                  // Agrega validaciones adicionales según tus requisitos
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addExpense,
                child: Text('Add Expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void showNotification(String s) {}
}
