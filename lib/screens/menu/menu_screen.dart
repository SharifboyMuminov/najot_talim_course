import 'package:default_project/moduls/data_repo.dart';
import 'package:default_project/moduls/subjec_modul.dart';
import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late List<SubjectModul> data;
  @override
  void initState() {
    DataRepository.instanse.connetcAllSobject();

    data = DataRepository.allSubject;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_273032,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.we, vertical: 90.he),
          child: Column(
            children: [
              ...List.generate(
                data.length,
                (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10.he),
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.he, horizontal: 20.we),
                        backgroundColor: data[index].color,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen(
                                data: data[index],
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data[index].name,
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: AppColors.c_F2F2F2,
                            ),
                          ),
                          Text(
                            data[index].level.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.c_F2F2F2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
