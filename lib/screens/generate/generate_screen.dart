import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';

class GenerateScreen extends StatefulWidget {
  const GenerateScreen({super.key});

  @override
  State<GenerateScreen> createState() => _GenerateScreenState();
}

class _GenerateScreenState extends State<GenerateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(0.84),
      appBar: AppBar(
        backgroundColor: AppColors.c_333333.withOpacity(0.84),
        title: Text("Generate Screen"),
      ),
    );
  }
}
