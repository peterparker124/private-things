import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: Colors.white,)
    );
  }
}

displayLoader(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => Material(
            type: MaterialType.transparency,
            child: Center(
              child: LoaderProgressBar(),
            ),
          ));
}
