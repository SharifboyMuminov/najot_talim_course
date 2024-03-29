import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.pngPath,
      required this.onTab,
      required this.active});

  final String pngPath;
  final VoidCallback onTab;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: active ? Colors.yellow: Colors.white,
        padding: const EdgeInsets.all(10),
      ),
      onPressed: onTab,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            pngPath,
            color: active ? Colors.white : Colors.black,
            width: 30.we,
            height: 30.we,
          ),
          SizedBox(width: 5.we),
          Text(
            "Worke",
            style: TextStyle(
              color: active ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
