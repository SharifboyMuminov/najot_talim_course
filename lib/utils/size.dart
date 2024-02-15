import 'package:flutter/material.dart';

double width = 0.0;
double height = 0.0;

extension Size on int {
  double get he => (this / 844) * height;
  double get we => (this / 390) * width;

  SizedBox getH() => SizedBox(height: (this / 844) * he);
  SizedBox getW() => SizedBox(height: (this / 390) * we);
}
