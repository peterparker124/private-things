import 'package:flutter/cupertino.dart';

class Dimensions {
  static final double defaultText = 16.0;
  static final double smallText = 12.0;
  static final double extraSmallText = 12.0;
  static final double largeText = 20.0;
  static final double extraLargeText = 30.0;


  static final double height = 5.0;


}

class Borders {
  static const BorderSide primaryBorder = BorderSide(
    color: Color.fromARGB(255, 238, 238, 238),
    width: 1,
    style: BorderStyle.solid,
  );
  static const BorderSide secondaryBorder = BorderSide(
    color: Color.fromARGB(255, 59, 89, 152),
    width: 1,
    style: BorderStyle.solid,
  );
}


class Shadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromARGB(41, 0, 0, 0),
    offset: Offset(0, 3),
    blurRadius: 6,
  );
  static const BoxShadow secondaryShadow = BoxShadow(
    color: Color.fromARGB(41, 0, 0, 0),
    offset: Offset(0, 2),
    blurRadius: 6,
  );
}