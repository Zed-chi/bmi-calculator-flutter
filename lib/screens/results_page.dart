import 'package:bmi_calculator/constants.dart';
import "package:flutter/material.dart";
import "../components/reusable_card.dart";
import "../components/bottom_button.dart";
import "../calculator.dart";


class ResultsPage extends StatelessWidget {
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
                    "o",
                    style: kResultTextStyle,
                  ),
                  Text(
                    "89",
                    style: kBMITextStyle,
                  ),
                  Text(
                    "description",
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