import 'package:default_project/screens/widgets/my_contenir.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/local/local.dart';
import '../../utils/size.dart';
import '../widgets/menu_button.dart';
import '../widgets/recent_button.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  int activIndex = 0;

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
        appBar: AppBar(
          backgroundColor: AppColors.c_000000,
          centerTitle: true,
          title: Text(
            "Transactions",
            style: TextStyle(
                color: AppColors.c_F9F9F9,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: AppColors.c_000000,
        body: Column(
          children: [
            20.getH(),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.we, vertical: 25.he),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent",
                          style: TextStyle(
                            color: AppColors.c_EEEEEE,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 3.we)),
                          onPressed: () {},
                          child: Text(
                            "Select Time Range",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.c_EEEEEE,
                              color: AppColors.c_EEEEEE,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    22.getH(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MenuButton(
                          onTab: () {
                            setState(() {
                              activIndex = 0;
                            });
                          },
                          title: "All",
                          isNotActiv: activIndex == 0,
                        ),
                        MenuButton(
                          colorIcon: const Color(0xFF439E41),
                          icon: AppImages.arrowBottom,
                          onTab: () {
                            setState(() {
                              activIndex = 1;
                            });
                          },
                          title: "Income",
                          isNotActiv: activIndex == 1,
                        ),
                        MenuButton(
                          colorIcon: const Color(0xFFC5626E),
                          icon: AppImages.arrowTop,
                          onTab: () {
                            setState(() {
                              activIndex = 2;
                            });
                          },
                          title: "Income",
                          isNotActiv: activIndex == 2,
                        ),
                      ],
                    ),
                    32.getH(),
                    Text(
                      "Today",
                      style: TextStyle(
                        color: AppColors.c_EEEEEE.withOpacity(0.80),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    25.getH(),
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
                    32.getH(),
                    Text(
                      "Yesterday",
                      style: TextStyle(
                        color: AppColors.c_EEEEEE.withOpacity(0.80),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    25.getH(),
                    MyConterin(
                      child: Column(
                        children: [
                          ...List.generate(
                            yesterdayInofModuls.length,
                            (index) {
                              return RecentTransactionsButton(
                                recentTransactions: yesterdayInofModuls[index],
                                onTab: () {},
                                isNotEnd:
                                    index + 1 != yesterdayInofModuls.length,
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
          ],
        ),
      ),
    );
  }
}
