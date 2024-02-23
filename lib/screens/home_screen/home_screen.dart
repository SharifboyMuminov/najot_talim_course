import 'package:default_project/data/local/local.dart';
import 'package:default_project/screens/home_screen/widgets/admiin_button.dart';
import 'package:default_project/screens/widgets/my_contenir.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/my_cards.dart';
import 'widgets/my_cards_button.dart';
import '../widgets/recent_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.c_414A61,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.c_414A61,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_414A61,
        body: Column(
          children: [
            44.getH(),
            Padding(
              padding: EdgeInsets.only(top: 26.we),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Good Morning!\n",
                      style: TextStyle(
                        color: AppColors.c_CECECE,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "John Smith",
                          style: TextStyle(
                            color: AppColors.c_F9F9F9,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60.we,
                    height: 60.we,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppImages.image1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            22.getH(),
            Text(
              "\$ 8,640.00",
              style: TextStyle(
                color: AppColors.c_F9F9F9,
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            12.getH(),
            Text(
              "Available Balance",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.c_D8D8D8,
              ),
            ),
            23.getH(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 25.he),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.c_000000,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.only(left: 25.we, right: 25.we, bottom: 40.he),
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              homeIcons.length,
                              (index) {
                                return AdminButton(
                                  title: homeTexts[index],
                                  icon: homeIcons[index],
                                  onTab: () {},
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      35.getH(),
                      MenutextAndButton(
                        onTab: () {},
                        text: 'My Cards',
                      ),
                      22.getH(),
                      MyConterin(
                        child: Column(
                          children: [
                            ...List.generate(
                              cardModuls.length,
                              (index) {
                                return MyCardsButton(
                                  onTab: () {},
                                  cardModul: cardModuls[index],
                                  isNotEnd: index + 1 != cardModuls.length,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      24.getH(),
                      MenutextAndButton(
                        onTab: () {},
                        text: 'Recent Transactions',
                      ),
                      MyConterin(
                        child: Column(
                          children: [
                            ...List.generate(
                              recents.length,
                              (index) {
                                return RecentTransactionsButton(
                                  recentTransactions: recents[index],
                                  onTab: () {},
                                  isNotEnd: index + 1 != recents.length,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
