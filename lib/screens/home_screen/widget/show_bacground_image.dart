import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';

class ShowBacgroundImage extends StatelessWidget {
  const ShowBacgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          "https://w0.peakpx.com/wallpaper/728/790/HD-wallpaper-nature-animation-amoled-anime-landscape-thumbnail.jpg",
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        color: Colors.grey,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
