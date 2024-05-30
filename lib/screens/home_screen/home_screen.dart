import 'package:audioplayers/audioplayers.dart';
import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final player = AudioPlayer();
  int currentIndex = 0;
  Duration maxDuration = const Duration(seconds: 0);
  bool play = false;

  bool showMusic = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 30.we, right: 30.he, top: 80.he),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              musics.length,
              (index) {
                return ListTile(
                  leading: Image.network(
                    musics[index].imageUrl,
                    width: 50.we,
                    height: 50.we,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    musics[index].musicName,
                    style: TextStyle(
                      color: AppColors.cE5E5E5,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    musics[index].subTitle,
                    style: TextStyle(
                      color: AppColors.cE5E5E5,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          showMusic = !showMusic;
          setState(() {});
        },
        child: AnimatedContainer(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 500),
          height: showMusic ? height : 100.he,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.r),
              topRight: Radius.circular(5.r),
            ),
            color: AppColors.c5E5A5A,
          ),
        ),
      ),
    );
  }
}
