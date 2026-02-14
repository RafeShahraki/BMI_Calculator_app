import 'dart:math';

class BmiBrain {
  final int weight; // in kg
  final int height; // in cm

  BmiBrain({required this.weight, required this.height});

  // Calculate BMI on demand
  double get _bmiValue => weight / pow(height / 100, 2);

  String get bmi => _bmiValue.toStringAsFixed(1);

  String get condition {
    final bmi = _bmiValue;
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  String get suggest {
    final bmi = _bmiValue;
    if (bmi < 18.5) return 'Eat more protein';
    if (bmi < 25) return 'Keep up the good work!';
    return 'Exercise more and eat healthier';
  }
}
