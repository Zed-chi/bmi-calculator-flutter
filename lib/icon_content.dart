import "package:flutter/material.dart";
import "./constants.dart";


class IconContent extends StatelessWidget {
  final IconData icon;
  final String title;
  IconContent({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,size: 80),
        SizedBox(height: 15),
        Text(title, style: kLabelTextStyle)
      ],
    );
  }
}