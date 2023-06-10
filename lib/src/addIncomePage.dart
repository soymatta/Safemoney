// DEPENDENCIAS
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:status_alert/status_alert.dart';

// CLASES
import 'classes/income.dart';

// PAGINAS
import 'dashboardPage.dart';

class AddIncomePage extends StatefulWidget {
  static const routeName = 'Add_new_income';

  const AddIncomePage({Key? key}) : super(key: key);

  @override
  _AddIncomePageState createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  int _balance = 0;
  int temBalance = 0;
  String incomeName = '';
  int incomeAmount = 0;
  List<Income> _incomeList = [];

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textControllerDigit = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    _textControllerDigit.dispose();
    super.dispose();
    loadIncomeList();
  }

  Future<void> loadIncomeList() async {
    final incomeListB = await IncomePreferences.getIncomeList();
    setState(() {
      _incomeList = incomeListB;
    });
  }

  Future<void> _loadBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _balance = prefs.getInt('balance') ?? 0;
    });
  }

  Future<void> _saveBalance(int balance) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('balance', balance);
  }

  @override
  void initState() {
    super.initState();
    _loadBalance();
    loadIncomeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff7DE494), Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25.0,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(
                  width: 37,
                ),
                Text(
                  'Add a new income',
                  style: GoogleFonts.rubik(
                    color: const Color(0xFF57636C),
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(30),
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        color: const Color(0xffA3F2B4),
                        border: const Border(
                          top: BorderSide(width: 2, color: Color(0xff559964)),
                          bottom:
                              BorderSide(width: 4, color: Color(0xff559964)),
                          left: BorderSide(width: 2, color: Color(0xff559964)),
                          right: BorderSide(width: 2, color: Color(0xff559964)),
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
                              style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: _textController,
                              decoration: const InputDecoration(
                                  labelText: "Name of income"),
                              onChanged: (newvalue) {
                                setState(() {
                                  incomeName = newvalue;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: _textControllerDigit,
                              decoration: const InputDecoration(
                                  labelText: "Amount of money"),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (newvalue) {
                                setState(() {
                                  incomeAmount = int.parse(newvalue);
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (incomeName == '') {
                                  StatusAlert.show(
                                    context,
                                    duration: const Duration(seconds: 1),
                                    title: 'Insert a valide name',
                                  );
                                  return;
                                }

                                _incomeList.add(Income(
                                  name: incomeName,
                                  amount: incomeAmount,
                                ));

                                StatusAlert.show(
                                  context,
                                  duration: const Duration(seconds: 1),
                                  title: 'Your income was added',
                                  configuration: const IconConfiguration(
                                      icon: Icons.check),
                                );

                                _textControllerDigit.clear();
                                _textController.clear();

                                temBalance = _balance -
                                    incomeAmount; // Guarda el calculo del balance en una variable

                                setState(() {
                                  _balance =
                                      temBalance; // Convierte la variable temporal en string

                                  _saveBalance(
                                      _balance); // Guardar la variable balance en shared_preferences

                                  IncomePreferences.setIncomeList(
                                      _incomeList); // Guarda el arraylist en shared preferences
                                });

                                incomeName = '';
                                incomeAmount = 0;
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(120, 50),
                                backgroundColor: const Color(0xFF43E576),
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
            ),
          ],
        ),
      ),
    );
  }
}
