import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "../components/icon_content.dart";
import "../components/reusable_card.dart";
import "../constants.dart";
import './results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import "../calculator.dart";


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

          BottomButton(
            title: "Calculate", 
            onTap: (){
              Calculator calc = Calculator(height: height, weight: weight);
              
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return ResultsPage(
                    bmiRes: calc.calculateBMI(),
                    resText: calc.getResults(),
                    interpret: calc.getInterpretation(),
                  );
        }
        ));
      },)
        ],
      )
    );
  }
}