import 'package:default_project/cubits/user/user_cubit.dart';
import 'package:default_project/data/models/user/user_model.dart';
import 'package:default_project/screens/chats/chats_screen.dart';
import 'package:default_project/screens/regestr/login_screen.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../data/local/storage_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.microtask(() async {
      await Future.delayed(const Duration(seconds: 2));
      String docId = StorageRepository.getString(key: "doc_id");
      UserModel? userModel;
      debugPrint("My DocID: $docId");
      if (docId.isNotEmpty) {
        userModel = await context.read<UserCubit>().getUser(docId: docId);
      }

      if (userModel != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ChatsScreen(userModel: userModel!);
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(child: Lottie.asset("assets/lottie/splash_lottie.json")),
    );
  }
}
