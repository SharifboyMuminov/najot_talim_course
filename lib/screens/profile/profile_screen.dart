import 'package:default_project/utils/size.dart';
import 'package:default_project/view/authe_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = context.watch<AuthViewModel>().getUser;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Profile Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthViewModel>().logout(context);
            },
            icon: Icon(
              Icons.exit_to_app,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: user == null
          ? Center(
              child: Text(
                "User not found",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 10.he),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (user!.photoURL != null)
                    Center(
                      child: Image.network(
                        user!.photoURL.toString(),
                      ),
                    ),
                  if (user!.photoURL == null)
                    Center(
                      child: Icon(
                        Icons.person,
                        size: 100.sp,
                      ),
                    ),
                  30.getH(),
                  Text(
                    "Name: ${user!.displayName}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  10.getH(),
                  Text(
                    "Email: ${user!.email}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                ],
              ),
            ),
    );
  }
}
