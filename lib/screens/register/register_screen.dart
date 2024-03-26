import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../../view/authe_view.dart';
import '../../view/login_view.dart';
import '../widget/text_filde.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  bool obThorText = false;

  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<AuthViewModel>(context, listen: false);
    var provideListen = Provider.of<AuthViewModel>(context, listen: true);
    return Scaffold(
      body: provideListen.loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : SingleChildScrollView(
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
                      color: const Color(0xFF000000),
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  10.getH(),
                  TextFromFieldMyWidget(
                    icon: "assets/icons/person.svg",
                    hitText: 'Name',
                    controller: controllerName,
                    onTab: () {},
                    onChange: context.read<LoginViewModel>().updateEmail,
                  ),
                  3.getH(),
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
                    margin: EdgeInsets.symmetric(
                        horizontal: 52.we, vertical: 30.he),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 17.he),
                        backgroundColor: AppColors.c_1317DD,
                      ),
                      onPressed: () {
                        provide.register(
                          context,
                          email: controllerEmail.text,
                          name: controllerName.text,
                          password: controllerPassword.text,
                        );
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
                  Text(
                    "OR",
                    style: TextStyle(
                      color: AppColors.c_131212.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  10.getH(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Log in with",
                      style: TextStyle(
                        color: AppColors.c_131212.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
