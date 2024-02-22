import 'package:default_project/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text1 = "";
  String text2 = "";

  @override
  void initState() {
    if(sharedPreferences != null){
      text1 = sharedPreferences!.getString("email") ?? "";
      text1 = sharedPreferences!.getString("password") ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(text1),
          Text(text2),

        ],
      ),
    );
  }
}
