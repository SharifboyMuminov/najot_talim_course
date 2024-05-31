import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomMyItem extends StatelessWidget {
  const BottomMyItem({
    super.key,
    required this.isPlay,
    required this.onTabStartAdnPaused,
  });

  final bool isPlay;
  final VoidCallback onTabStartAdnPaused;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 85.we,
          height: 85.we,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            image: const DecorationImage(
              image: NetworkImage(
                "https://c.saavncdn.com/979/Odamlar-Nima-deydi-feat-Timur-Alixonov-Unknown-2022-20221114085825-500x500.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10.we),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Remedy",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.cE5E5E5,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Annie Schindel",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.c_BCBCBC,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(13),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: () {},
            child: Icon(
              isPlay ? Icons.play_arrow : Icons.pause,
              size: 28.sp,
            ),
          ),
        ),
      ],
    );
  }
}
