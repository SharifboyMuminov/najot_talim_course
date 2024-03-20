import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:default_project/screens/profile/profile_screen.dart';
import 'package:default_project/view/login_view.dart';
import 'package:default_project/view/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _screens = const [HomeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<TabViewModel>(context, listen: false);
    var provideListen = Provider.of<TabViewModel>(context, listen: true);
    return Scaffold(
      body: _screens[provideListen.activeScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provideListen.activeScreen,
        onTap: (v){
          provide.setActiveScreen(v);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
