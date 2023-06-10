// DEPENDENCIAS
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// CLASES
import 'classes/income.dart';

class IncomeLogs extends StatefulWidget {
  static const routeName = 'Income_Logs';

  const IncomeLogs({Key? key}) : super(key: key);

  @override
  _IncomeLogsState createState() => _IncomeLogsState();
}

class _IncomeLogsState extends State<IncomeLogs> {
  List<Income> incomeList = [];

  @override
  void initState() {
    super.initState();
    loadIncomeList();
  }

  Future<void> loadIncomeList() async {
    final incomeListB = await IncomePreferences.getIncomeList();
    setState(() {
      incomeList = incomeListB;
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
                  'Your incomes',
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
                        itemCount: incomeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final income = incomeList.reversed.toList()[index];
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
                                  income.name,
                                  style: const TextStyle(
                                    fontFamily: 'Google.rubik',
                                  ),
                                ),
                                trailing: Image.asset(
                                  'assets/imgs/ahorrando-dinero.png',
                                  width: 50,
                                  height: 50,
                                ),
                                subtitle: Text(
                                  '\$${income.amount}',
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
