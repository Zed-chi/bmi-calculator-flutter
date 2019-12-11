import 'package:bmi_calculator/constants.dart';
import "package:flutter/material.dart";
import "../components/reusable_card.dart";
import "../components/bottom_button.dart";
import "../calculator.dart";


class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiRes, this.interpret, this.resText});
  final String bmiRes;
  final String resText;
  final String interpret;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("Results Page")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "Your result",
                textAlign: TextAlign.center,
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiRes,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpret,
                    textAlign: TextAlign.center,
                    style:kBodyTextStyle
                  ),
                  BottomButton(
                    title: "Re-calculate",
                    onTap: (){
                      Navigator.pop(context);
                    }
                  )


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}