import 'package:default_project/cubits/user/user_cubit.dart';
import 'package:default_project/data/local/storage_repository.dart';
import 'package:default_project/data/models/user/user_model.dart';
import 'package:default_project/screens/chats/chats_screen.dart';
import 'package:default_project/screens/regestr/sign_up_screen.dart';
import 'package:default_project/screens/regestr/widget/ok_button.dart';
import 'package:default_project/screens/regestr/widget/text_input.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            50.getH(),
            Image.asset("assets/images/img.png", width: 240.we),
            16.getH(),
            Text(
              "LOGIN",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            50.getH(),
            TextInputMyWidget(
              hitText: 'Enter name',
              textEditingController: controllerName,
            ),
            TextInputMyWidget(
              hitText: 'Enter password',
              textEditingController: controllerPassword,
            ),
            60.getH(),
            OkButton(
              title: 'LOGIN',
              onTab: () {
                if (controllerName.text.isNotEmpty &&
                    controllerPassword.text.isNotEmpty) {
                  UserModel? userModel = context.read<UserCubit>().containsUser(
                      fullName: controllerName.text,
                      password: controllerPassword.text);

                  if (userModel != null) {
                    StorageRepository.setString(
                        key: "doc_id", value: userModel.docId);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChatsScreen(userModel: userModel);
                        },
                      ),
                    );
                  } else {
                    _showSnackBar(title: "No User :(");
                  }
                } else {
                  _showSnackBar();
                }
              },
            ),
            50.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    " Register now",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showSnackBar({String title = "Empty input"}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
        ),
      ),
    );
  }
}
