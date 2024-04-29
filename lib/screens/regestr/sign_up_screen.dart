import 'dart:io';

import 'package:default_project/cubits/image/image_cubit.dart';
import 'package:default_project/cubits/user/user_cubit.dart';
import 'package:default_project/data/local/storage_repository.dart';
import 'package:default_project/data/models/user/user_model.dart';
import 'package:default_project/screens/chats/chats_screen.dart';
import 'package:default_project/screens/regestr/dialog_image/dialog_image.dart';
import 'package:default_project/screens/regestr/widget/ok_button.dart';
import 'package:default_project/screens/regestr/widget/text_input.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  XFile? xFile;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SingleChildScrollView(
              child: Column(
                children: [
                  150.getH(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                      onPressed: () {
                        showImageDialog(
                          context,
                          onChaneXFile: (ChangeImage changeImage) {
                            xFile = changeImage.xFile;
                            setState(() {});
                          },
                        );
                      },
                      child: Container(
                        width: 200.we,
                        height: 200.we,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: xFile != null
                              ? DecorationImage(
                                  image: FileImage(File(xFile!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                  16.getH(),
                  Text(
                    "SIGN UP",
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
                    onTab: clickLogin,
                  ),
                  50.getH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
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
                          Navigator.pop(context);
                        },
                        child: Text(
                          " Login",
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

  clickLogin() async {
    if (controllerName.text.isNotEmpty && controllerPassword.text.isNotEmpty) {
      if (context
          .read<UserCubit>()
          .toResembleUser(password: controllerPassword.text)) {
        loading = true;
        setState(() {});
        String urlImage = "";
        if (xFile != null) {
          urlImage = await context.read<ImageCubit>().addImageInFireBase(
                file: File(xFile!.path),
                fileName: "user_images/${xFile!.name}",
              );
        }

        UserModel userModel = UserModel(
          imageUrl: urlImage,
          docId: "",
          fullName: controllerName.text,
          storegiPath: xFile != null ? "user_images/${xFile!.name}" : "",
          password: controllerPassword.text,
        );

        String myDocId =
            await context.read<UserCubit>().insertUser(userModel: userModel);

        userModel = userModel.copyWith(docId: myDocId);

        StorageRepository.setString(key: "doc_id", value: userModel.docId);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ChatsScreen(userModel: userModel);
            },
          ),
        );
        loading = false;
        setState(() {});
      } else {
        _showSnackBar(title: "Passwor tug'ri kelmaydi.");
      }
    } else {
      _showSnackBar();
    }
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
