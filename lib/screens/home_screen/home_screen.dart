import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/foundation.dart';
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
  late ValueListenable<Duration> progress;
  bool play = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // getMaxDuration() {
    //   widget.player.getDuration().then((value) {
    //     maxDuration = value ?? const Duration(seconds: 0);
    //     setState(() {});
    //   });
    // }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 30.we, right: 30.he, top: 80.he),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 335.we,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 30,
                    spreadRadius: 0,
                    offset: const Offset(0, 2),
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(
                    musics[currentIndex % musics.length].imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20.he),
            Text(
              musics[currentIndex % musics.length].musicName,
              style: TextStyle(
                color: AppColors.cE5E5E5,
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),
            ),
            Text(
              musics[currentIndex % musics.length].subTitle,
              style: TextStyle(
                color: AppColors.cE5E5E5,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 20.he),
            ProgressBar(
              timeLabelTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              baseBarColor: AppColors.c5E5A5A,
              progressBarColor: AppColors.c52D7BF,
              thumbColor: AppColors.c52D7BF.withOpacity(0.7),
              progress: Duration(seconds: 1),
              total: Duration(seconds: 5),
            ),
            SizedBox(height: 20.he),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      player.pause();
                      player.play(AssetSource(
                          musics[--currentIndex % musics.length].pathMusic));
                      play = true;
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.skip_previous,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (play) {
                        player.play(AssetSource(
                            musics[currentIndex % musics.length].pathMusic));
                      } else {
                        player.pause();
                      }
                      play = !play;
                      setState(() {});
                    },
                    child: Icon(
                      play ? Icons.play_arrow_rounded : Icons.pause,
                      size: 28.sp,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      player.pause();
                      player.play(AssetSource(
                          musics[++currentIndex % musics.length].pathMusic));
                      play = true;
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.skip_next_rounded,
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
}
