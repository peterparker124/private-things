import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String text;
  final FontWeight fontWeight;
  final double textSize;
  final Color color;
  final String style;

  CustomText(this.text, this.textSize, this.fontWeight, this.color,this.style);

  @override
  Widget build(BuildContext context) {
    return Text( text,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: style,
        decoration: TextDecoration.none,
      ),
    );
  }
}

