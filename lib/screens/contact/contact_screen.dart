import 'package:default_project/screens/contact/widget/contact_button.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

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
              onTab: () async {
                // debugPrint("Qonday");
                final Uri phoneUrl = Uri(
                  scheme: 'tel',
                  path: '+998913662637',
                );
                UrlLauncher.launchUrl(phoneUrl);
              },
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
            SizedBox(height: 50.he),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    AppImages.linkSvg,
                    width: 50.we,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                  onPressed: () {
                    Uri  instagramUrl = Uri.parse("https://www.instagram.com/sharifboy_muminov/");
                    UrlLauncher.launchUrl(instagramUrl);
                  },
                  child: SvgPicture.asset(
                    AppImages.instagramSvg,
                    width: 50.we,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    AppImages.watsapSvg,
                    width: 50.we,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    AppImages.beSvg,
                    width: 50.we,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
