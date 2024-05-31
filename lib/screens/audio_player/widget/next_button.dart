import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NextMyButton extends StatelessWidget {
  const NextMyButton({super.key, required this.onTab, required this.icon});

  final VoidCallback onTab;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: const BoxDecoration(
        color: Colors.white10,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: onTab,
        child:  Icon(
          icon,
          color: AppColors.white,
        ),
      ),
    );
  }
}
