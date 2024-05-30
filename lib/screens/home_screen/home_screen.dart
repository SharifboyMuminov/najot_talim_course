import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final player = AudioPlayer();
  // int currentIndex = 0;
  // Duration maxDuration = const Duration(seconds: 0);
  // bool play = false;
  //
  bool showMusic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text(
          "Songs",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
            color: AppColors.cF0F0F0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: AppColors.white,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.we),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white10,
        ),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 5.he),
          itemCount: musics.length,
          itemBuilder: (BuildContext context, int index) {
            return TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 8.we, right: 6.we),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.he),
                    width: 85.we,
                    height: 85.we,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                        image: NetworkImage(
                          musics[index].imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.we),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remedy",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.cE5E5E5,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Annie Schindel",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.c_BCBCBC,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppImages.noActiveFavoriteSvg,
                      width: 20.we,
                      height: 20.we,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppImages.threeHorizontalDot,
                      width: 24.we,
                      height: 24.we,
                    ),
                  ),
                ],
              ),
            );
          },
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

// import 'package:default_project/utils/size.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:on_audio_query/on_audio_query.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final _audioQuery = OnAudioQuery();
//   final player = AudioPlayer();
//
//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Music List",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//             fontSize: 20.sp,
//           ),
//         ),
//       ),
//       body: FutureBuilder<List<SongModel>>(
//         future: _audioQuery.querySongs(
//           sortType: null,
//           orderType: OrderType.ASC_OR_SMALLER,
//           uriType: UriType.EXTERNAL,
//           ignoreCase: true,
//         ),
//         builder:
//             (BuildContext context, AsyncSnapshot<List<SongModel>> snapshot) {
//           if (snapshot.hasError) {
//             return const Center(child: Text("Error :("));
//           }
//
//           if (snapshot.data == null) {
//             return const Center(child: CircularProgressIndicator.adaptive());
//           }
//
//           if (snapshot.data!.isEmpty) {
//             return const Center(child: Text("Empty music folder :)"));
//           }
//
//           return SingleChildScrollView(
//             child: Column(
//               children: List.generate(snapshot.data!.length, (index) {
//                 return ListTile(
//                   onTap: ()async {
//                     print('----------${snapshot.data![index].data}');
//                     await player.setFilePath('/storage/emulated/0/Download/Konsta .mp3');
//                     await player.play();
//                   },
//                   title: Text(snapshot.data![index].title),
//                   subtitle: Text(snapshot.data![index].data),
//                 );
//               }),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
