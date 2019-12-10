import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "./icon_content.dart";
import "./reusable_card.dart";
import "./constants.dart";


enum Gender {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Gender selectedGender = null;
  int height = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('BMI CALCULATOR'))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color:selectedGender == Gender.male ? kActiveCardColor: kInactiveCardColor,
                    cardChild: IconContent(
                      icon:FontAwesomeIcons.mars, 
                      title:"Male"
                    ),
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;                       
                      });
                    },
                  ),
                ),

                Expanded(                  
                  child: ReusableCard(
                    color:selectedGender == Gender.female ? kActiveCardColor: kInactiveCardColor,
                    cardChild: IconContent(
                      icon:FontAwesomeIcons.venus, 
                      title:"FeMale"
                    ),
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;                                                
                      });
                    },
                    ),                                                  
                ),
              ],
          )),
          Expanded(
            child: ReusableCard(
              color:kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Height",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style:kNumTextStyle
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    onChanged:(double newValue){                    
                      setState(() {
                        height = newValue.round();
                        print(newValue);

                      });                      
                    },
                    activeColor: Color(0xffeb1555),
                    inactiveColor: Color(0xff8d8e98),
                    value: height.toDouble(),
                    min:0.0,
                    max:220.0,
                  )
                ],
              ),
              )
            ),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(color:kActiveCardColor)),
              Expanded(child: ReusableCard(color:kActiveCardColor))
            ],
          )),

          Container(
            color: kBottomColor,
            margin: EdgeInsets.only(top:10),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      )
    );
  }
}