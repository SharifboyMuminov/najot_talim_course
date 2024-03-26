import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/model/user/user_model.dart';
import 'package:default_project/screens/category/category_screen.dart';
import 'package:default_project/utils/app_contans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String email = "";
  String password = "";

  updateEmail(String v) {
    email = v;
  }

  updatePassword(String v) {
    password = v;
  }

  login(BuildContext context) async {
    debugPrint("Keldi");

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        debugPrint("UID:${credential.user!.uid}");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CategoryScreen();
            },
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> register(
    BuildContext context, {
    required String email,
    required String name,
    required String password,
  }) async {
    debugPrint("asdfadfa");

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

}
