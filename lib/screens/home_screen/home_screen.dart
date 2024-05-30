import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';

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
