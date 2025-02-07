import "dart:math";

class Calculator{
  Calculator({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if (_bmi > 25){
      return "overweight";
    } else if (_bmi > 18.5){
      return "Normal"   ;
    } else {
      return "Underweight";
    }
  }

  String getInterpretation(){
    if (_bmi > 25){
      return "overweight, exercise more";
    } else if (_bmi > 18.5){
      return "Normal"   ;
    } else {
      return "Underweight, eat more";
    }
  }

}