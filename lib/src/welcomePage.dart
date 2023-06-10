// DEPENDENCIAS
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safemoney/src/setCurrencyPage.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = 'Say_welcome';

  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(),
              Column(
                children: [
                  Image.asset(
                    'assets/imgs/icon.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome!',
                    style: GoogleFonts.rubik(
                        fontSize: 40, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'We are SafeMoney, an app that will help you track your expenses and income, knowing where you spend your money, your mandatory expenses, necessary expenses, savings and goals.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        fontSize: 16, color: const Color(0xff57636c)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enjoy SafeMoney',
                    style: GoogleFonts.rubik(fontSize: 30),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SetCurrencyPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA3F2B4),
                    borderRadius: BorderRadius.circular(10),
                    border: const Border(
                      top: BorderSide(width: 2, color: Color(0xFF559964)),
                      bottom: BorderSide(width: 4, color: Color(0xFF559964)),
                      left: BorderSide(width: 2, color: Color(0xFF559964)),
                      right: BorderSide(width: 2, color: Color(0xFF559964)),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Get started',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
