import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:default_project/screens/widgets/global_text_fild.dart';
import 'package:default_project/screens/widgets/text_global.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/local_keys.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';

import '../../data/local/storage_repository.dart';
import '../widgets/global_button.dart';
import '../widgets/global_skip_button.dart';
import '../widgets/question_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isError = false;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32.he),
        child: Column(
          children: [
            67.getH(),
            TextGlobal(title: "Login"),
            200.getH(),
            GlobalTextFild(
                edgeInsets:
                    EdgeInsets.symmetric(vertical: 12.he, horizontal: 16.we),
                textInputType: TextInputType.emailAddress,
                isError: isError,
                text: "Email",
                hinText: "Email",
                controller: controllerEmail),
            GlobalTextFild(
              edgeInsets:
                  EdgeInsets.symmetric(vertical: 12.he, horizontal: 16.we),
              textInputType: TextInputType.visiblePassword,
              isError: isError,
              text: "Password",
              hinText: "Password",
              controller: controllerPassword,
            ),
            30.getH(),
            GlobalButton(
              title: "Validate",
              textColor: AppColors.c_0001FC,
              onTab: () {
                if (StorageRepository.getString(key: ShareKeys.email) ==
                        controllerEmail.text.toString() &&
                    StorageRepository.getString(key: ShareKeys.password) ==
                        controllerPassword.text.toString()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomeScreen();
                      },
                    ),
                  );
                }
              },
            ),
            20.getH(),
            QuestionButton(
              onTab: () {},
              text1: "Don’t have an account?",
              text2: "Sign-up",
            ),
            GlobalScipButton(
              title: "Skip for now",
              onTab: () {},
            ),
          ],
        ),
      ),
    );
  }
}
