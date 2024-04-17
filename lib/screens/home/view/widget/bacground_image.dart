import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';

class BacgroundImage extends StatelessWidget {
  const BacgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://w0.peakpx.com/wallpaper/728/790/HD-wallpaper-nature-animation-amoled-anime-landscape-thumbnail.jpg",
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
