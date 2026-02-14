import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constents.dart';

class iconAndText extends StatelessWidget {
  final String iconText;
  final IconData iconShape;
  iconAndText({required this.iconText, required this.iconShape});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(iconShape, size: 50),
        SizedBox(height: 10),
        Text(iconText, style: TextStyle(fontSize: 20)),
      ],
    );
  }
}

class Reusablecard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final GestureTapCallback? onPress;
  Reusablecard({required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colour,
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String buttonText;
  final GestureTapCallback? func;
  BottomButton({required this.buttonText, this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        color: Colors.pinkAccent,
        width: double.infinity,
        height: bottomHeight,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback? onPress;
  final Widget? buttonChild;
  MyButton({this.onPress, this.buttonChild});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(height: 48, width: 48),
      child: buttonChild,
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(100)),
      ),
      fillColor: const Color.fromARGB(255, 65, 100, 239),
    );
  }
}
