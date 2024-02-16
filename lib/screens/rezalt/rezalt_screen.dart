import 'package:default_project/moduls/subjec_modul.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class RezaltScreen extends StatefulWidget {
  const RezaltScreen(
      {super.key, required this.dic, required this.subjectModul});
  final Map<int, int> dic;
  final SubjectModul subjectModul;

  @override
  State<RezaltScreen> createState() => _RezaltScreenState();
}

class _RezaltScreenState extends State<RezaltScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
