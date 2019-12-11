import "package:flutter/material.dart";


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