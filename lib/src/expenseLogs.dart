// DEPENDENCIAS
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// CLASES
import 'classes/expense.dart';

class ExpenseLogs extends StatefulWidget {
  static const routeName = 'Expense_Logs';

  const ExpenseLogs({Key? key}) : super(key: key);

  @override
  _ExpenseLogsState createState() => _ExpenseLogsState();
}

class _ExpenseLogsState extends State<ExpenseLogs> {
  List<Expense> expenseList = [];

  @override
  void initState() {
    super.initState();
    loadExpenseList();
  }

  Future<void> loadExpenseList() async {
    final expenseListB = await ExpensePreferences.getExpenseList();
    setState(() {
      expenseList = expenseListB;
    });
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
              padding: const EdgeInsets.only(left: 12, top: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25.0,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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
                  'Your expenses',
                  style: GoogleFonts.rubik(
                    color: const Color(0xFF57636C),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
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
                      child: ListView.builder(
                        itemCount: expenseList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final expense = expenseList.reversed.toList()[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffA3F2B4),
                                border: const Border(
                                  top: BorderSide(
                                      width: 2, color: Color(0xff559964)),
                                  bottom: BorderSide(
                                      width: 4, color: Color(0xff559964)),
                                  left: BorderSide(
                                      width: 2, color: Color(0xff559964)),
                                  right: BorderSide(
                                      width: 2, color: Color(0xff559964)),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: Text(
                                  expense.name,
                                  style: const TextStyle(
                                    fontFamily: 'Google.rubik',
                                  ),
                                ),
                                trailing: Image.asset(
                                  'assets/imgs/demanda.png',
                                  width: 50,
                                  height: 50,
                                ),
                                subtitle: Text(
                                  '\$${expense.amount}',
                                  style: const TextStyle(
                                    fontFamily: 'Google.rubik',
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
