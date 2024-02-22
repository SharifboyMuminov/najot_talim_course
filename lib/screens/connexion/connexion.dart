import 'package:default_project/screens/sign/sign_screen.dart';
import 'package:default_project/screens/widgets/global_button.dart';
import 'package:default_project/screens/widgets/text_global.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/question_button.dart';

class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({super.key});

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.we),
        child: Column(
          children: [
            67.getH(),
            const TextGlobal(
              title: 'Connexion',
            ),
            const Spacer(),
            GlobalButton(
              title: "Create an account",
              textColor: AppColors.c_0001FC,
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignScreen();
                    },
                  ),
                );
              },
            ),
            32.getH(),
            GlobalButton(
              title: "Connect with Google",
              textColor: AppColors.c_555555,
              onTab: () {},
              icon: AppImages.googleLogo,
            ),
            16.getH(),
            GlobalButton(
              backgroundColor: AppColors.c_415A93,
              title: "Connect with Facebook",
              textColor: AppColors.c_FFFFFF,
              onTab: () {},
              icon: AppImages.facebookLogo,
            ),
            40.getH(),
            QuestionButton(
              onTab: () {},
            ),
            100.getH(),
          ],
        ),
      ),
    );
  }
}
