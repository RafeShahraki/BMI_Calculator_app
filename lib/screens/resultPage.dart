import 'package:bmi_calculator/widgets/myWidgets.dart';
import 'package:flutter/material.dart';

class resultPage extends StatefulWidget {
  const resultPage();
  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  late Map<String, String> data =
      ModalRoute.of(context)!.settings.arguments as Map<String, String>;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusablecard(
              colour: Colors.blueAccent,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    data['condition']!,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 114, 251, 119),
                    ),
                  ),
                  Text(
                    data['bmi']!,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: BottomButton(buttonText: 'Re-Calculate')),
        ],
      ),
    );
  }
}
