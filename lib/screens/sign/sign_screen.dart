import 'package:default_project/screens/login/login_screen.dart';
import 'package:default_project/screens/sign/widgets/text_filds.dart';
import 'package:default_project/screens/widgets/global_button.dart';
import 'package:default_project/screens/widgets/global_skip_button.dart';
import 'package:default_project/screens/widgets/question_button.dart';
import 'package:default_project/screens/widgets/text_global.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/local_keys.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';

import '../../data/local/storage_repository.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  TextEditingController controllerFullname = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  void initState() {
    StorageRepository.setBool(key: ShareKeys.isOnbar, value: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32.we),
        child: Column(
          children: [
            67.getH(),
            const TextGlobal(title: "Create an account"),
            127.getH(),
            TextFildsWidget(
              controllerFullname: controllerFullname,
              controllerEmail: controllerEmail,
              controllerPassword: controllerPassword,
            ),
            32.getH(),
            GlobalButton(
                title: "Validate",
                textColor: AppColors.c_0001FC,
                onTab: () {
                  _setData();
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  });
                }),
            40.getH(),
            QuestionButton(onTab: () {}),
            50.getH(),
            GlobalScipButton(title: "Skip for now", onTab: () {}),
          ],
        ),
      ),
    );
  }

  void _setData() {
    StorageRepository.setString(
        key: ShareKeys.email, value: controllerEmail.text.toString());
    StorageRepository.setString(
        key: ShareKeys.fullName, value: controllerFullname.text.toString());

    StorageRepository.setString(
        key: ShareKeys.password, value: controllerPassword.text.toUpperCase());
  }
}
