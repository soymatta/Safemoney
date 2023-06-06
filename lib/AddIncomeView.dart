// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< HEAD
import 'package:google_fonts/google_fonts.dart';
=======
import 'HomePage.dart';
>>>>>>> e110a68e909ec48c5abc4d2697c0eedae14ce9cb

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
  State<AddIncomeView> createState() => _AddIncomeViewState();

  static final TextEditingController _textController = TextEditingController();

  static final TextEditingController _textControllerDigit =
      TextEditingController();
}

class _AddIncomeViewState extends State<AddIncomeView> {
  String incomeName = '';
  double incomeAmount = 0;

<<<<<<< HEAD
=======
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textControllerDigit = TextEditingController();

  void _addIncome(String Name, double amount){

    IncomeManager().addIncome(Income(name: incomeName, amount: incomeAmount));



    _textController.clear();
    _textControllerDigit.clear();
    
    print('works');

  }

>>>>>>> e110a68e909ec48c5abc4d2697c0eedae14ce9cb
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Income'),
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
                border: Border(
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
                      'To add a new income just fill in the fields with the required information and when you press the button, make sure that the data is correct, it cannot be corrected later.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF57636C),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: AddIncomeView._textController,
                      decoration:
                          const InputDecoration(labelText: "Name of income"),
                      onChanged: (newvalue) {
                        setState(() {
                          incomeName = newvalue;
                        });
                        // saveBalance(); GUARDAR LA VARIABLE EN SHARED PREFERENCES SETBALANCEPAGE
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: AddIncomeView._textControllerDigit,
                      decoration:
                          const InputDecoration(labelText: "Amount of money"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (newvalue) {
                        setState(() {
                          incomeAmount = int.parse(newvalue);
                        });
                        // saveBalance(); GUARDAR LA VARIABLE EN SHARED PREFERENCES COPIADO DE SETBALANCEPAGE
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para manejar el evento onPressed
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(120, 50),
                        primary: Color(0xFF43E576),
                      ),
                      child: Text(
                        'Add',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
<<<<<<< HEAD
        ),
=======
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
>>>>>>> e110a68e909ec48c5abc4d2697c0eedae14ce9cb
      ),
    );
  }
}
