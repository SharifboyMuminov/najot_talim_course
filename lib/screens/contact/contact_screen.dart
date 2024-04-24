import 'package:default_project/screens/contact/widget/contact_button.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.we),
        child: Column(
          children: [
            SizedBox(width: width),
            Text(
              "Hello there! I live in Uzbekistan, Chust (Namangan), and there are many ways to contact me:",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 20.he),
            ContactButton(
              iconsPath: AppImages.callSvg,
              title: "+998 91 366 26 37",
              onTab: () {},
            ),
            SizedBox(height: 10.he),
            ContactButton(
              iconsPath: AppImages.messegSvg,
              title: "muminovsharifboy@gmail.com",
              onTab: () {},
            ),
            SizedBox(height: 10.he),
            ContactButton(
              iconsPath: AppImages.globusSvg,
              title: "muminovsharifboy@gmail.com",
              onTab: () {},
            ),
            SizedBox(height: 30.he),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset(AppImages.linkSvg,width: 50.we,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
