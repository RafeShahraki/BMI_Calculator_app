import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/resultPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 80, 5, 184),
        appBarTheme: AppBarThemeData(
          backgroundColor: const Color.fromARGB(255, 70, 5, 162),
        ),
      ),
      home: InputPage(),
      routes: {
        '/home': (context) => InputPage(),
        '/result': (context) => resultPage(),
      },
    );
  }
}
