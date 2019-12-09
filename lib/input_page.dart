import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "./icon_content.dart";
import "./reusable_card.dart";


const bottomContainerHeight = 80.0;
const darkGray = Color(0xff1d1e33);
const bottomColor = Color(0xffeb1555);


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('BMI CALCULATOR'))),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color:darkGray,
                  cardChild: new IconContent(
                    icon:FontAwesomeIcons.mars, 
                    title:"Male"
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color:darkGray,
                  cardChild: new IconContent(
                    icon:FontAwesomeIcons.venus, 
                    title:"Female"
                  ),                
                ),
              ),
            ],
          )),
          Expanded(child: ReusableCard(color:darkGray)),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(color:darkGray)),
              Expanded(child: ReusableCard(color:darkGray))
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