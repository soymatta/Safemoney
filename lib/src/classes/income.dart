import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Income {
  final String name;
  final int amount;

  Income({required this.name, required this.amount});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
    };
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      name: map['name'],
      amount: map['amount'],
    );
  }
}

class IncomePreferences {
  static const _key = 'incomeList';

  static Future<List<Income>> getIncomeList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) {
      return [];
    }
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Income.fromMap(json)).toList();
  }

  static Future<void> setIncomeList(List<Income> incomeList) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList =
        incomeList.map((income) => income.toMap()).toList();
    final jsonString = json.encode(jsonList);
    await prefs.setString(_key, jsonString);
  }
}
