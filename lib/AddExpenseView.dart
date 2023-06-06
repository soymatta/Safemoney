// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Expense {
  String name;
  double amount;

  Expense({
    required this.name,
    required this.amount,
  });
}

class AddExpenseView extends StatefulWidget {
  static const String routeName = 'AddNewExpense';

  const AddExpenseView({super.key});

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();

  static final TextEditingController _textController = TextEditingController();

  static final TextEditingController _textControllerDigit =
      TextEditingController();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  String expenseName = '';
  int expenseAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(
                  top: BorderSide(width: 3, color: Colors.black),
                  bottom: BorderSide(width: 7, color: Colors.black),
                  left: BorderSide(width: 3, color: Colors.black),
                  right: BorderSide(width: 3, color: Colors.black),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'To add a new epense just fill in the fields with the required information and when you press the button, make sure that the data is correct, it cannot be corrected later.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF57636C),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: AddExpenseView._textController,
                      decoration:
                          const InputDecoration(labelText: "Name of expense"),
                      onChanged: (newvalue) {
                        setState(() {
                          expenseName = newvalue;
                        });
                        // saveBalance(); GUARDAR LA VARIABLE EN SHARED PREFERENCES SETBALANCEPAGE
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: AddExpenseView._textControllerDigit,
                      decoration:
                          const InputDecoration(labelText: "Amount of money"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (newvalue) {
                        setState(() {
                          expenseAmount = int.parse(newvalue);
                        });
                        // saveBalance(); GUARDAR LA VARIABLE EN SHARED PREFERENCES COPIADO DE SETBALANCEPAGE
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para manejar el evento onPressed
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 50), backgroundColor: const Color(0xFF43E576),
                      ),
                      child: const Text(
                        'Add',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
