import 'package:flutter/material.dart';

Widget getNormalText(String text, Color color, double fontSize, {TextDirection? fixDirection , bool isTextCenter = false }) {
  return Text(
    text.trim(),
    softWrap: true,
    textAlign: isTextCenter ? TextAlign.center: TextAlign.left,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
    ),
  );
}

Widget getNormalCenterAlignedText(String text, Color color, double fontSize) {
  return Text(
    text.trim(),
    softWrap: true,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
    ),
  );
}

Widget getNormalUnderlinedText(String text, Color color, double fontSize, GestureTapCallback callback, {TextDirection? fixDirection}) {
  return GestureDetector(
    onTap: callback,
    child: Text(
      text.trim(),
      textDirection: fixDirection,
      softWrap: true,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        decoration: TextDecoration.underline
      ),
    ),
  );
}

Widget getBoldText(String text, Color color, double fontSize, {TextDirection? fixDirection}) {
  return Text(
    text.trim(),
    textDirection: fixDirection,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget getCircleText(String text, double height, Color color, double fontSize, {TextDirection? fixDirection}) {
  return Container(
    height: height,
    width: height ,
    decoration: BoxDecoration(
      border: Border.all(width: 1 ,color: color),
      shape: BoxShape.circle,
      color: Colors.white,
    ),
    child: Center(
      child: Text(
        text.trim(),
        textDirection: fixDirection,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget getBoldCenterAlignedText(String text, Color color, double fontSize, {TextDirection? fixDirection}) {
  return Text(
    text.trim(),
    softWrap: true,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget getMultilineBoldText(String text, Color color, double fontSize) {
  return Flexible(
    child: Text(
      text.trim(),
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget getMultilineNormalText(String text, Color color, double fontSize) {
	return Flexible(
		child: Text(
			text.trim(),
			softWrap: true,
			style: TextStyle(
				color: color,
				fontSize: fontSize,
			),
		),
	);

}