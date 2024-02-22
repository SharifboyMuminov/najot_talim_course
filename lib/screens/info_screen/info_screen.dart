import 'package:default_project/screens/data/moduls/categoriy_info_modul.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.infoModul});
  final CategoryInfoModul infoModul;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info Modul"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.he),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.getH(),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.network(
                infoModul.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            30.getH(),
            Text(
              "Name: ${infoModul.name}",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            Text(
              "Price: ${infoModul.price}",
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            20.getH(),
            Center(
                child: Text(
              "Description",
              style: TextStyle(
                fontSize: 16.sp,
              ),
            )),
            Text(infoModul.description),
          ],
        ),
      ),
    );
  }
}
