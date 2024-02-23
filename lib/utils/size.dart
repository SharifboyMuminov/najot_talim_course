import 'package:flutter/material.dart';

double width = 0.0;
double height = 0.0;

extension Size on int {
  double get he => (this / 926) * height;
  double get we => (this / 428) * width;

  SizedBox getH() => SizedBox(height: (this / 926) * height);
  SizedBox getW() => SizedBox(height: (this / 428) * height);
}
