import 'package:audioplayers/audioplayers.dart';
import 'package:default_project/blocs/favorite/favorite_bloc.dart';
import 'package:default_project/blocs/favorite/favorite_event.dart';
import 'package:default_project/blocs/favorite/favorite_state.dart';
import 'package:default_project/data/enums/form_status/formS_status.dart';
import 'package:default_project/data/models/favorite/favorite_model.dart';
import 'package:default_project/screens/audio_player/audio_player_screen.dart';
import 'package:default_project/screens/home_screen/widget/bottom_item.dart';
import 'package:default_project/screens/home_screen/widget/music_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final player = AudioPlayer();
  final _audioQuery = OnAudioQuery();
  Duration currentDuration = const Duration(seconds: 0);

  int currentIndex = 0;
  Duration maxDuration = const Duration(seconds: 0);
  bool isPlay = false;
  bool showMusic = false;
  List<SongModel> songModels = [];

  _listenAudioPlayer() {
    player.onPositionChanged.listen((Duration d) {
      currentDuration = d;
    });
  }

  @override
  void initState() {
    _listenAudioPlayer();
    super.initState();
  }

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
        child: Stack(
          children: [
            FutureBuilder<List<SongModel>>(
              future: _audioQuery.querySongs(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<SongModel>> snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Error :("));
                }

                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return const Center(child: Text("Empty Music."));
                  } else {
                    songModels = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 5.he),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MusicMyButton(
                          imageUrl:
                              "https://c.saavncdn.com/979/Odamlar-Nima-deydi-feat-Timur-Alixonov-Unknown-2022-20221114085825-500x500.jpg",
                          onTab: () {
                            currentIndex = index;
                            isPlay = true;
                            showMusic = true;
                            setState(() {});
                          },
                          songModel: snapshot.data![index],
                          onTabFavorite: () {
                            if (_containsFavorite(
                                songModel: snapshot.data![index])) {
                              context.read<FavoriteBloc>().add(
                                    FavoriteInsertEvent(
                                      favoriteModel: FavoriteModel(
                                        id: snapshot.data![index].id,
                                      ),
                                    ),
                                  );
                            } else {
                              context.read<FavoriteBloc>().add(
                                    FavoriteDeleteEvent(
                                      favoriteModel: FavoriteModel(
                                        id: snapshot.data![index].id,
                                      ),
                                    ),
                                  );
                            }
                          },
                          isFavorite: _containsFavorite(
                            songModel: snapshot.data![index],
                          ),
                        );
                      },
                    );
                  }
                }

                return const Center(
                    child: CircularProgressIndicator.adaptive());
              },
            ),
            BlocListener<FavoriteBloc, FavoriteState>(
              listener: (BuildContext context, FavoriteState state) {
                if (state.formsStatus == FormsStatus.success) {
                  debugPrint("My Length: ${state.favoriteModels.length}");

                  setState(() {});
                } else if (state.formsStatus == FormsStatus.error) {
                  debugPrint("My Error: ${state.errorText}");
                }
              },
              child: SizedBox(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: !showMusic
            ? () {
                showMusic = true;
                isPlay = true;
                setState(() {});
              }
            : null,
        child: AnimatedContainer(
          padding: !showMusic
              ? EdgeInsets.symmetric(horizontal: 20.we, vertical: 15.he)
              : null,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 300),
          height: showMusic ? height : 100.he,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
            color: showMusic ? Colors.black : AppColors.c686D76,
          ),
          child: showMusic
              ? AudioPlayerScreen(
                  duration: currentDuration,
                  arrowBack: () {
                    showMusic = false;
                    setState(() {});
                  },
                  player: player,
                  songModel: songModels[currentIndex],
                  songModels: songModels,
                  currentIndex: currentIndex,
                  setCurrentIndex: (v) {
                    currentIndex = v;
                  },
                  isPlay: (v) {
                    isPlay = v;
                    setState(() {});
                  },
                )
              : BottomMyItem(
                  isPlay: isPlay,
                  onTabStartAdnPaused: _onTabStartAndStop,
                ),
        ),
      ),
    );
  }

  _containsFavorite({required SongModel songModel}) {
    List<FavoriteModel> favorite =
        context.read<FavoriteBloc>().state.favoriteModels;

    return (favorite.where((element) => element.id == songModel.id).toList())
        .isNotEmpty;
  }

  _onTabStartAndStop() {
    if (!isPlay) {
      player.play(
          DeviceFileSource(songModels[currentIndex % songModels.length].data));
    } else {
      player.pause();
    }

    isPlay = !isPlay;
    setState(() {});
  }
}
