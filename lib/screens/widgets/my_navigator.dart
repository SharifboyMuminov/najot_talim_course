import 'package:flutter/material.dart';

void myNavigatorPush(BuildContext context, {required Widget widget}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ),
  );
}
