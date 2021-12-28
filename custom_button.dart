import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_widget.dart';
import 'SizeConfig.dart';
import 'custom_color.dart';


class RaisedGradientButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? color;
  const RaisedGradientButton({
     Key? key,
     required this.text,
     required this.onPressed,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3.1),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            gradient: LinearGradient(
              colors: <Color>[
                color == null ?  MyColors.darkRed : color!,
                color == null ?  MyColors.darkRed : color!
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0),
                blurRadius: 0.0,
              ),
            ]),
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: customTextBold(text: text, fontSize: 5.0, textColor: MyColors.white),
          ),
        ),
      ),
    );
  }
}
