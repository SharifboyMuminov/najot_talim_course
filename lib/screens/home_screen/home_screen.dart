import 'package:default_project/data/local/local_data/local_data.dart';
import 'package:default_project/data/local/local_variables/local_variables.dart';
import 'package:default_project/screens/info/info_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/models/coffe_modul/coffe_modul.dart';
import 'widget/categoriy_button.dart';
import 'widget/favorite_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activIndex = 0;
  List<CoffeModul> activList = [];
  bool isShowTitle = false;
  ScrollController scrollController = ScrollController();

  setActivList() {
    switch (activIndex) {
      case 0:
        {
          activList = [];
          activList.addAll(coffeCappuchchino);
          activList.addAll(coffeEspresso);
          activList.addAll(coffeLatte);
          activList.addAll(coffeMocha);
          activList.shuffle();
          break;
        }
      case 1:
        {
          activList = coffeMocha;
          break;
        }
      case 2:
        {
          activList = coffeLatte;
          break;
        }
      case 3:
        {
          activList = coffeCappuchchino;
          break;
        }
      default:
        {
          activList = coffeEspresso;
        }
    }

    setState(() {});
  }

  @override
  void initState() {
    setActivList();
    setFavorite();

    scrollController.addListener(() {
      if (scrollController.position.pixels > 41.he) {
        isShowTitle = true;
      } else {
        isShowTitle = false;
      }
      setState(() {});
    });

    super.initState();
  }

  Future<void> setFavorite() async {
    coffeFavorite = await LocalDatabase.getAllFavoriteCoffe();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_0C0F14,
        centerTitle: true,
        title: coffeFavorite.isNotEmpty
            ? isShowTitle
                ? Text(
                    "home_screen.favorite".tr(),
                    style: TextStyle(
                      color: AppColors.c_FFFFFF,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                : null
            : null,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            width: 18.we,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/searche.svg",
              width: 18.we,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/favorite.svg",
              width: 18.we,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.c_0C0F14,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (coffeFavorite.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.we),
                child: Text(
                  "home_screen.favorite".tr(),
                  style: TextStyle(
                    color: AppColors.c_FFFFFF,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            if (coffeFavorite.isNotEmpty) 16.getH(),
            if (coffeFavorite.isNotEmpty)
              SizedBox(
                height: 430.he,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(
                      coffeFavorite.length,
                      (index) {
                        return FavoriteItem(
                          coffeModul: coffeFavorite[index],
                          onTabAdd: () {},
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return InfoScreen(
                                    coffeModul: coffeFavorite[index],
                                    onSet: () {
                                      setFavorite();
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            if (coffeFavorite.isNotEmpty) 14.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.we),
              child: Text(
                "home_screen.popular".tr(),
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            8.getH(),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.we),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    homeScreenTitleButtons.length,
                    (index) {
                      return TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.we, vertical: 8.he)),
                        onPressed: () {
                          activIndex = index;
                          setActivList();
                          setState(() {});
                        },
                        child: Text(
                          homeScreenTitleButtons[index],
                          style: TextStyle(
                            color: AppColors.c_FFFFFF
                                .withOpacity(activIndex == index ? 1 : 0.25),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (height - 250).h,
              width: width,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.we),
                itemCount: activList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20.we,
                    mainAxisSpacing: 26.he),
                itemBuilder: (context, index) {
                  CoffeModul coffeModul = activList[index];
                  return CategoryButton(
                    coffeModul: coffeModul,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return InfoScreen(
                              coffeModul: coffeModul,
                              onSet: () {
                                setState(() {});
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
