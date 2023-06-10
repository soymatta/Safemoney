import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Expense {
  final String name;
  final int amount;

  Expense({required this.name, required this.amount});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      name: map['name'],
      amount: map['amount'],
    );
  }
}

class ExpensePreferences {
  static const _key = 'expenseList';

  static Future<List<Expense>> getExpenseList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) {
      return [];
    }
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Expense.fromMap(json)).toList();
  }

  static Future<void> setExpenseList(List<Expense> expenseList) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList =
        expenseList.map((expense) => expense.toMap()).toList();
    final jsonString = json.encode(jsonList);
    await prefs.setString(_key, jsonString);
  }
}
