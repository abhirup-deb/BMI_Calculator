import 'package:flutter/material.dart';
import 'input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF190B2C),
        scaffoldBackgroundColor: Color(0xFF1A092A),
        textTheme : TextTheme(body1: TextStyle(color: Color(0xFF70FFC0))),
      ),
      home: InputPage(),
    );
  }
}

