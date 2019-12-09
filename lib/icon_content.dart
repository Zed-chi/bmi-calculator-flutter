import "package:flutter/material.dart";


const labelTextStyle = TextStyle(
  fontSize: 18, 
  color: Colors.white12
);


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
        Text(title, style: labelTextStyle)
      ],
    );
  }
}