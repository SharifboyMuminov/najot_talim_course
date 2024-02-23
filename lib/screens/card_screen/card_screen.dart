import 'package:flutter/material.dart';

import '../../utils/size.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class CaardScreen extends StatefulWidget {
  const CaardScreen({super.key});

  @override
  State<CaardScreen> createState() => _CaardScreenState();
}

class _CaardScreenState extends State<CaardScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return const Placeholder();
  }
}
