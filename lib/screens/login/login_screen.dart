import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'widget/text_filde.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  bool obThorText = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            30.getH(),
            Image.asset(
              "assets/images/img.png",
              height: 225.he,
            ),
            16.getH(),
            Text(
              "LOGIN",
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            10.getH(),
            TextFromFieldMyWidget(
              icon: "assets/icons/messeg.svg",
              hitText: 'Email',
              controller: controllerEmail,
              onTab: () {},
              onChange: context.read<LoginViewModel>().updateEmail,
            ),
            3.getH(),
            TextFromFieldMyWidget(
              icon: "assets/icons/login.svg",
              hitText: 'Password',
              controller: controllerPassword,
              isPassword: true,
              obscureText: obThorText,
              onTab: () {
                obThorText = !obThorText;
                setState(() {});
              },
              onChange: context.read<LoginViewModel>().updatePassword,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 52.we, vertical: 50.he),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 17.he),
                  backgroundColor: AppColors.c_1317DD,
                ),
                onPressed: () {
                  context.read<LoginViewModel>().login(context);
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: AppColors.c_FFFFFF,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
