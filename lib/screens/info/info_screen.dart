import 'package:default_project/data/models/product/product_model.dart';
import 'package:default_project/screens/edit/edit_screen.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen(
      {super.key, required this.productModul, required this.onSet});
  final ProductModul productModul;
  final VoidCallback onSet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EditScreen(
                      productModul: productModul,
                      onSet: () {
                        onSet.call();
                      },
                    );
                  },
                ),
              );
            },
            icon: Icon(
              Icons.edit,
              color: Colors.black,
              size: 20.sp,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Info Product",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22.sp,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(productModul.imageUrl),
            ),
            50.getH(),
            _getRichText("Model:   ", productModul.prodctName),
            10.getH(),
            _getRichText("Price:   ", productModul.price.toString()),
            30.getH(),
            Center(
              child: Text(
                "Descreption",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            10.getH(),
            Text(
              productModul.decoretion,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getRichText(String text1, String text2) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: text2,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
