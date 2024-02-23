import 'package:flutter/material.dart';

class RecentTransactions {
  final String icon;
  final String title;
  final String money;
  final Color bacgoundColor;
  final ColorFilter? colorFilter;

  RecentTransactions(
      {required this.icon,
      required this.bacgoundColor,
      required this.money,
      required this.title,
      this.colorFilter});
}
