import 'package:default_project/utils/size.dart';
import 'package:flutter/cupertino.dart';

import 'size_button.dart';

class SizeItem extends StatelessWidget {
  const SizeItem(
      {super.key,
      required this.activIndex,
      required this.onTanM,
      required this.onTanL,
      required this.onTanS});
  final int activIndex;
  final VoidCallback onTanS;
  final VoidCallback onTanM;
  final VoidCallback onTanL;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizeButton(
            onPressed: onTanS,
            title: 'S',
            isActiv: activIndex == 0,
          ),
        ),
        SizedBox(width: 16.we),
        Expanded(
          child: SizeButton(
            onPressed: onTanM,
            title: 'M',
            isActiv: activIndex == 1,
          ),
        ),
        SizedBox(width: 16.we),
        Expanded(
          child: SizeButton(
            onPressed: onTanL,
            title: 'L',
            isActiv: activIndex == 2,
          ),
        ),
      ],
    );
  }
}
