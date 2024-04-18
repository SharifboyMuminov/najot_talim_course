import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({super.key, required this.urlImage});

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10.we, vertical: 10.he),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: CachedNetworkImage(
          imageUrl: urlImage,
          placeholder: (context, url) => Container(
            width: width,
            height: height,
            color: Colors.grey,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
          height: 140.he,
        ),
      ),
    );
  }
}
