import 'package:flutter/material.dart';

class CustomEditText extends StatefulWidget {
   final String hintText;
  TextEditingController controller = new TextEditingController();
   TextInputType inputType;
   final TextInputAction inputAction;

  CustomEditText(
      {Key? key, required this.hintText,
        required this.controller,
        required this.inputType,
        required this.inputAction}) : super(key: key);

  @override
  _CustomEditTextState createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.4),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              topLeft: Radius.circular(40.0)),
          color: Colors.white),
      height: 150,
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.start,
        keyboardType: widget.inputType,
        textInputAction: widget.inputAction,
        //inputType: TextInputType.emailAddress,inputAction:TextInputAction.next,
        // onSubmitted: (_) => FocusScope.of(context).nextFocus(),
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Medium",
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
            fontFamily: "Medium",
          ),
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.only(left: 20.0,right: 20),
        ),
      ),
    );
  }
}
