import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "./icon_content.dart";
import "./reusable_card.dart";
import "./constants.dart";
import './results_page.dart';


enum Gender {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Gender selectedGender = null;
  int height = 120;
  int weight = 60;
  int age = 20;

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
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      overlayColor: Color(0x29eb1555),
                      thumbColor: Color(0xffeb1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30
                      )
                    ),
                    child: Slider(
                      onChanged:(double newValue){                    
                        setState(() {
                          height = newValue.round();                        
                        });                      
                      },                                            
                      value: height.toDouble(),
                      min:0.0,
                      max:220.0,
                    ),
                  )
                ],
              ),
              )
            ),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color:kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Weight",
                        style:kLabelTextStyle
                      ),
                      Text(
                        weight.toString(),
                        style: kNumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            func: (){
                              setState(() {
                                weight += 1;
                              });
                            }
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            func: (){
                              setState(() {
                                weight -= 1;
                              });
                            }
                          )
                        ],
                      )
                    ],
                  ),
                )
              ),
              Expanded(child: ReusableCard(
                  color:kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Age",
                        style:kLabelTextStyle
                      ),
                      Text(
                        age.toString(),
                        style: kNumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            func: (){
                              setState(() {
                                age += 1;
                              });
                            }
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            func: (){
                              setState(() {
                                age -= 1;
                              });
                            }
                          )
                        ],
                      )
                    ],
                  ),
                ))
            ],
          )),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                return ResultsPage();
              }
              ));
            },
            child: Container(
              child: Text("Calculate", style: kNumTextStyle,),
              color: kBottomColor,
              margin: EdgeInsets.only(top:10),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          )
        ],
      )
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.func});
  final Function func;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: func,
      shape: CircleBorder(),
      elevation: 0,
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}