import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marc/utils/constants.dart';
import 'package:marc/utils/custom_color.dart';
import 'package:marc/utils/custom_widget.dart';

Widget noTextFound({required bool showNotFound , required String text}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (text == Constants.PleaseWait) CircularProgressIndicator(color: MyColors.darkRed,),
        SizedBox(
          height: 10,
        ),
        customTextRegular(
            text: text,
            fontSize: 4,
            textColor: MyColors.grayText),
      ],
    ),
  );
}

PreferredSize appbar(height, BuildContext context) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, height + 80),
    child: Stack(
      children: <Widget>[
        Container(
          // Background
          child: Center(
            child: Text(
              "Affiliates",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          color: Theme.of(context).primaryColor,
          height: height + 75,
          width: MediaQuery.of(context).size.width,
        ),

        Container(), // Required some widget in between to float AppBar

        Positioned(
          // To take AppBar Size only
          top: 100.0,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            backgroundColor: Colors.red,
            leading: Icon(
              Icons.menu,
              color: Theme.of(context).primaryColor,
            ),
            primary: false,
            title: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey))),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications,
                    color: Theme.of(context).primaryColor),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    ),
  );
}


String getStatus(String type ) {
  switch (type) {
    case 'N':
      return "Pending";
    case 'P':
      return "Pending";
    case 'R':
      return "Rejected";
    case 'A':
      return "Accepted";
  }
  return type;
}

Color getColorStatus(String type ) {
  switch (type) {
    case 'N':
      return Colors.red;
    case 'P':
      return Colors.red;
    case 'R':
      return Colors.red;
    case 'A':
      return Colors.green;
  }
  return Colors.red;
}

bool getButtonVisible(String type ) {
  switch (type) {
    case 'N':
      return true;
    case 'P':
      return true;
    case 'R':
      return false;
    case 'A':
      return false;
  }
  return false;
}