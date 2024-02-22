import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/local/storage_repository.dart';
import '../../utils/local_keys.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    StorageRepository.setBool(key: ShareKeys.isRegister, value: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hello ${StorageRepository.getString(
            key: ShareKeys.fullName,
          )}",
          style: TextStyle(
            color: AppColors.c_0001FC,
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
