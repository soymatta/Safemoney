import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key, required this.title});

  final String title;

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.openSans(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF43E576),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Otros widgets dentro de la columna
          ],
        ),
      ),
    );
  }
}
