import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marc/utils/text_styles.dart';
import 'my_color.dart';

getGenericButtonWidget({required BuildContext context, required String text, required ButtonType type, bool isEnabled = true, required GestureTapCallback callBack, required GestureTapCallback longCallBack}) {
  Color backgroundColor = BUTTON_PRIMARY;
  Color borderColor = BUTTON_PRIMARY;
  Color textColor = WHITE;

  if (type == ButtonType.RED) {
    backgroundColor = BUTTON_RED;
    borderColor = BUTTON_RED;
  } else if (type == ButtonType.SECONDARY) {
    backgroundColor = WHITE;
    borderColor = BUTTON_GREY;
    textColor = BUTTON_GREY;
  } else if (type == ButtonType.PRIMARY && !isEnabled) {
    backgroundColor = BUTTON_PRIMARY_DISABLED;
    borderColor = BUTTON_PRIMARY_DISABLED;
  } else if (type == ButtonType.PRIMARY_OUTLINED) {
    backgroundColor = WHITE;
    textColor = BUTTON_PRIMARY;
    borderColor = BUTTON_PRIMARY;
  }
  else if (type == ButtonType.Flat ) {
    backgroundColor = WHITE;
    borderColor = Colors.transparent;
    textColor = BUTTON_GREY;
  }

  return MaterialButton(
    onPressed: isEnabled ? callBack : () {},
    onLongPress: longCallBack,
    minWidth: MediaQuery.of(context).size.width / 2,
    color: backgroundColor,
    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(100), side: BorderSide(color: borderColor, width: 1, style: BorderStyle.solid)),
    child: getNormalText(text, textColor, 20),
    padding: const EdgeInsets.symmetric(vertical: 12),
  );
}

enum ButtonType {
  PRIMARY,
  PRIMARY_OUTLINED,
  SECONDARY,
  RED,
  Flat
}