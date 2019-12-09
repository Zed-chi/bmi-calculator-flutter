import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "./icon_content.dart";
import "./reusable_card.dart";


const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xff1d1e33);
const inactiveCardColor = Color(0xff111328);
const bottomColor = Color(0xffeb1555);


enum Gender {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Gender selectedGender = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('BMI CALCULATOR'))),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color:selectedGender == Gender.male ? activeCardColor: inactiveCardColor,
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
                    color:selectedGender == Gender.female ? activeCardColor: inactiveCardColor,
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
          Expanded(child: ReusableCard(color:activeCardColor)),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(color:activeCardColor)),
              Expanded(child: ReusableCard(color:activeCardColor))
            ],
          )),

          Container(
            color: bottomColor,
            margin: EdgeInsets.only(top:10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      )
    );
  }
}