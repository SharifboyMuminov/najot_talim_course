import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggerGridMyWidget extends StatelessWidget {
  const StaggerGridMyWidget({super.key, required this.child});

  final List<Widget> child;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
      children: [
        StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: child,
        ),
      ],
    );
  }
}
