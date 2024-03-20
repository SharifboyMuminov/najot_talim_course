import 'package:default_project/view/authe_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthViewModel>().logout(context);
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
