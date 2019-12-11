import 'package:bmi_calculator/constants.dart';
import "package:flutter/material.dart";


class BottomButton extends StatelessWidget {
  final Function onTap;
  final String title;
  BottomButton({this.onTap, this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Text("Calculate", style: kLargeButtonTextStyle,),
        color: kBottomColor,
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(top:10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
