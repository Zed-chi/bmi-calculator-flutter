import "package:flutter/material.dart";

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
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(darkGray),
              ),
              Expanded(
                child: ReusableCard(darkGray),
              ),        
            ],
          )),
          Expanded(
            child: ReusableCard(darkGray),
          ),
          Expanded(child: Row(
            children: <Widget>[

              Expanded(
                child: ReusableCard(darkGray),
              ),

              Expanded(
                child: ReusableCard(darkGray),
              ),        
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

class ReusableCard extends StatelessWidget {
  final Color color;
  ReusableCard(@required this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}