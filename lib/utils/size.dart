import 'package:flutter/material.dart';

double width = 0.0;
double height = 0.0;

extension Size on int {
  double get he => (this / 852) * height;
  double get we => (this / 393) * width;

  SizedBox getH() => SizedBox(height: (this / 812) * height);
  SizedBox getW() => SizedBox(height: (this / 375) * width);
}
