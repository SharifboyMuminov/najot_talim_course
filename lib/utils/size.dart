import 'package:flutter/material.dart';

double width = 0.0;
double height = 0.0;

extension Size on int {
  double get he => (this / 812) * height;
  double get we => (this / 375) * width;

  SizedBox getH() => SizedBox(height: this.he);
  SizedBox getW() => SizedBox(height: this.we);
}
