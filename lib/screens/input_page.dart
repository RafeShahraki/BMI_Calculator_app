import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/myWidgets.dart';
import '../constents.dart';
import 'package:bmi_calculator/bmi_brain.dart';

enum Gender { male, female }

Gender? selectedGender;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int currentSliderValue = 20;
  String cuurentholder = '';
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? cardsColor
                        : inactivecardcolor,
                    cardChild: iconAndText(
                      iconText: 'Male',
                      iconShape: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: Reusablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? cardsColor
                        : inactivecardcolor,
                    cardChild: iconAndText(
                      iconText: 'Female',
                      iconShape: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusablecard(
              colour: inactivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height', style: TextStyle(fontSize: 20)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '$currentSliderValue',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text('cm', style: TextStyle(fontSize: 20)),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context),
                    child: Slider(
                      value: currentSliderValue.toDouble(),
                      divisions: 220,
                      max: 220,
                      activeColor: Colors.pink,
                      inactiveColor: Colors.grey,
                      onChanged: (double newvalue) {
                        setState(() {
                          currentSliderValue = newvalue.round();
                          //cuurentholder = currentSliderValue.round().toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusablecard(
                    colour: inactivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(weight.toString(), style: TextStyle(fontSize: 25)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyButton(
                              buttonChild: Icon(FontAwesomeIcons.arrowDown),
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            MyButton(
                              buttonChild: Icon(FontAwesomeIcons.arrowUp),
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Reusablecard(colour: inactivecardcolor)),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'Calculate',
            func: () {
              BmiBrain bmiBrain = BmiBrain(
                weight: weight,
                height: currentSliderValue,
              );
              Navigator.pushNamed(
                context,
                '/result',
                arguments: {
                  'bmi': bmiBrain.bmi,
                  'condition': bmiBrain.condition,
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
