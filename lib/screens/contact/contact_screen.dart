import 'dart:async';

import 'package:default_project/screens/contact/widget/contact_button.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;

import '../../server/share_image_server.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  GlobalKey _globalKey = GlobalKey();

  void _CaptureScreenShot() async {
    //get paint bound of your app screen or the widget which is wrapped with RepaintBoundary.
    RenderRepaintBoundary bound =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    if (bound.debugNeedsPaint) {
      Timer(const Duration(seconds: 1), () => _CaptureScreenShot());
      return null;
    }
    ui.Image image = await bound.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    // this will save image screenshot in gallery
    if (byteData != null) {
      Uint8List pngBytes = byteData.buffer.asUint8List();
      ImageGallerySaver resultsave = await ImageGallerySaver.saveImage(
          Uint8List.fromList(pngBytes),
          quality: 90,
          name: 'screenshot-${DateTime.now()}.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                // _CaptureScreenShot();
                WidgetSaverService.openWidgetAsImage(
                  context: context,
                  widgetKey: _globalKey,
                  fileId: "Qonday",
                );
              },
              icon: Icon(
                Icons.save,
                size: 26.sp,
              ),
            ),
          ],
        ),
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
                  Uri phoneUrl = Uri.parse('tel:+998913662637');

                  launchUrl(phoneUrl);
                },
              ),
              SizedBox(height: 10.he),
              ContactButton(
                iconsPath: AppImages.messegSvg,
                title: "muminovsharifboy@gmail.com",
                onTab: () {
                  Uri instagramUrl = Uri.parse("muminovsharifboy@gmail.com");
                  launchUrl(instagramUrl);
                },
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
                    onPressed: () {
                      Uri instagramUrl = Uri.parse(
                          "https://www.linkedin.com/in/sharifboy-muminov-8772b12b4/");
                      launchUrl(instagramUrl);
                    },
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
                      Uri instagramUrl = Uri.parse(
                          "https://www.instagram.com/sharifboy_muminov/");
                      launchUrl(instagramUrl);
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
                    onPressed: () {
                      Uri instagramUrl = Uri.parse("https://web.whatsapp.com/");
                      launchUrl(instagramUrl);
                    },
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
      ),
    );
  }
}
