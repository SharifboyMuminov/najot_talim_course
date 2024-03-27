import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/screens/login/login_screen.dart';
import 'package:default_project/screens/tabbar.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/model/user/user_model.dart';
import '../utils/app_contans.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool errorBorder = false;

  bool get loading => _isLoading;

  User? get getUser => FirebaseAuth.instance.currentUser;

  // Msh1234$

  Future<void> register(
    BuildContext context, {
    required String email,
    required String name,
    required String password,
  }) async {
    if (AppConstants.emailRegExp.hasMatch(email) &&
        AppConstants.passwordRegExp.hasMatch(password)) {
      try {
        _notify(true);
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (userCredential.user != null) {
          await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
          _insertUser(email: email, name: name, password: password);
          _notify(false);
        }
        _notify(false);

        if (context.mounted) {
          _notify(false);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TabScreen();
              },
            ),
          );
        }
      } on FirebaseException catch (e) {
        _notify(false);

        if (!context.mounted) return;
        showSnackBarMy(context, "Register FirebaseException $e");
      } catch (e) {
        _notify(false);
        if (!context.mounted) return;

        showSnackBarMy(context, "Register $e");
      }
    } else {
      _notify(false);

      showSnackBarMy(context, "Ilitom malumotni tug'ri to'ldiring :)");
      _setErrorBorder(true);
    }
  }

  Future<void> loginUser(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    if (AppConstants.emailRegExp.hasMatch(email) &&
        AppConstants.passwordRegExp.hasMatch(password)) {
      try {
        _notify(true);

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (userCredential.user != null) {
          _notify(false);

          if (!context.mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TabScreen();
              },
            ),
          );
        }
      } on FirebaseException catch (err) {
        _notify(false);
        _setErrorBorder(true);

        if (err.code == "wrong-password") {
          if (!context.mounted) return;
          showSnackBarMy(context, "Password xato :)");
        } else if (err.code == "invalid-email") {
          if (!context.mounted) return;

          showSnackBarMy(context, "Email Xato");
        } else if (err.code == "user-disabled:") {
          if (!context.mounted) return;

          showSnackBarMy(context, "foydalanuvchi tomonidan o'chirilgan");
        } else {
          if (!context.mounted) return;

          showSnackBarMy(context, "foydalanuvchi topilmadi");
        }
      } catch (e) {
        _notify(false);

        if (!context.mounted) return;

        showSnackBarMy(context, "Login catch $e");
      }
    } else {
      _notify(false);

      showSnackBarMy(context, "Ilitom malumotni tug'ri to'ldiring :)");
      _setErrorBorder(true);
    }
  }

  void _notify(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  void _setErrorBorder(bool v) {
    errorBorder = v;
    notifyListeners();
  }

  logout(BuildContext context) async {
    _notify(true);
    await FirebaseAuth.instance.signOut();
    _notify(false);
    if (!context.mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ),
    );
  }

  Future<void> _insertUser({
    required String email,
    required String name,
    required String password,
  }) async {
    var tokId = await FirebaseMessaging.instance.getToken();
    UserModel userModel = UserModel(
      email: email,
      docId: "",
      password: password,
      tokenId: tokId ?? "",
    );

    var docId = await FirebaseFirestore.instance
        .collection(AppConstants.userTable)
        .add(userModel.toJson());

    await FirebaseFirestore.instance
        .collection(AppConstants.userTable)
        .doc(docId.id)
        .update({"doc_id": docId.id});
  }
}

showSnackBarMy(BuildContext context, String text, [Color color = Colors.red]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        text,
        style: TextStyle(color: AppColors.c_FFFFFF, fontSize: 22.sp),
      ),
    ),
  );
}
