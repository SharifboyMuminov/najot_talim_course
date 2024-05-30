import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/screens/info/widget/next_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen(
      {super.key, required this.arrowBack, required this.player});

  final VoidCallback arrowBack;
  final AudioPlayer player;

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  int currentIndex = 0;
  Duration maxDuration = const Duration(seconds: 0);
  bool play = false;

  @override
  void initState() {
    // play = true;
    // widget.player.play(
    //   AssetSource(
    //     musics[--currentIndex % musics.length].pathMusic,
    //   ),
    // );
    super.initState();
  }

  getMaxDuration() {
    widget.player.getDuration().then((value) {
      maxDuration = value ?? const Duration(seconds: 0);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // getMaxDuration();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50.he),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: widget.arrowBack,
              icon: SvgPicture.asset(
                AppImages.arrowBottomSvg,
                width: 24.we,
                height: 24.we,
              ),
            ),
            Container(
              height: 335.we,
              margin: EdgeInsets.symmetric(horizontal: 20.we),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: Text(
                musics[currentIndex % musics.length].musicName,
                style: TextStyle(
                  color: AppColors.cE5E5E5,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: Text(
                musics[currentIndex % musics.length].subTitle,
                style: TextStyle(
                  color: AppColors.cE5E5E5,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(height: 20.he),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: StreamBuilder(
                stream: widget.player.onPositionChanged,
                builder:
                    (BuildContext context, AsyncSnapshot<Duration> snapshot) {
                  return ProgressBar(
                    timeLabelTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    baseBarColor: AppColors.c5E5A5A,
                    progressBarColor: AppColors.c52D7BF,
                    thumbColor: AppColors.c52D7BF.withOpacity(0.7),
                    progress: snapshot.data ?? const Duration(seconds: 1),
                    total: maxDuration,
                    onSeek: (duration) {
                      widget.player.seek(duration);
                      setState(() {});
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20.he),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NextMyButton(
                    onTab: _onTabIncrementAndDecrement,
                    icon: Icons.skip_previous,
                  ),
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: _onTabStartAndStop,
                      child: Icon(
                        play ? Icons.play_arrow_rounded : Icons.pause,
                        size: 28.sp,
                      ),
                    ),
                  ),
                  NextMyButton(
                    onTab: () {
                      _onTabIncrementAndDecrement(true);
                    },
                    icon: Icons.skip_next_rounded,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onTabStartAndStop() {
    if (play) {
      widget.player
          .play(AssetSource(musics[currentIndex % musics.length].pathMusic));
    } else {
      widget.player.pause();
    }
    getMaxDuration();

    play = !play;
    setState(() {});
  }

  _onTabIncrementAndDecrement([bool isIncrement = false]) {
    if (isIncrement) {
      currentIndex++;
    } else {
      currentIndex--;
    }

    widget.player.pause();
    widget.player
        .play(AssetSource(musics[currentIndex % musics.length].pathMusic));
    play = true;
    getMaxDuration();

    setState(() {});
  }
}
