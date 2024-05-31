import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicMyButton extends StatelessWidget {
  const MusicMyButton({
    super.key,
    required this.imageUrl,
    required this.onTab,
    required this.songModel,
  });

  final String imageUrl;
  final VoidCallback onTab;
  final SongModel songModel;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(left: 8.we, right: 6.we),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      onPressed: onTab,
      child: Row(
        children: [

          QueryArtworkWidget(
            nullArtworkWidget: Container(
              margin: EdgeInsets.symmetric(vertical: 5.he),
              width: 85.we,
              height: 85.we,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/odamlar.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            id: songModel.id,
            type: ArtworkType.ARTIST,
          ),
          SizedBox(width: 10.we),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songModel.displayName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.cE5E5E5,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  songModel.artist ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.c_BCBCBC,
                    fontSize: 12.sp,
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
              AppImages.threeHorizontalDotSvg,
              width: 24.we,
              height: 24.we,
            ),
          ),
        ],
      ),
    );
  }
}
