import 'package:flutter/material.dart';

double width = 0.0;
double height = 0.0;

extension Size on int {
  double get he => (this / 896) * height;
  double get we => (this / 414) * width;

  SizedBox getH() => SizedBox(height: (this / 896) * height);
  SizedBox getW() => SizedBox(width: (this / 414) * width);
}
