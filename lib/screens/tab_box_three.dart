import 'package:default_project/screens/card_screen/card_screen.dart';
import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:default_project/screens/profil_screen/profil_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import 'transactions_screen/transactions_screen.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class TabBoxThree extends StatefulWidget {
  const TabBoxThree({super.key});

  @override
  State<TabBoxThree> createState() => _TabBoxThreeState();
}

class _TabBoxThreeState extends State<TabBoxThree> {
  int _activeIndex = 0;
  ColorFilter colorFilter =
      const ColorFilter.mode(AppColors.c_FFFFFF, BlendMode.srcIn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          color: AppColors.c_FFFFFF,
        ),
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
          switch (newActiveIndex) {
            case 1:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CaardScreen(
                        onSet: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
            case 2:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TransactionsScreen(
                        onSet: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
            case 3:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfilScreen(
                        onSet: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
          }
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        backgroundColor: AppColors.c_000000,
        items: [
          BottomNavigationBarItem(
            activeIcon:
                SvgPicture.asset(AppImages.home, colorFilter: colorFilter),
            backgroundColor: AppColors.c_000000,
            icon: SvgPicture.asset(
              AppImages.home,
              colorFilter:
                  const ColorFilter.mode(AppColors.c_8D8D8D, BlendMode.srcIn),
              // width: 27.we,
              // height: 27.he,
            ),
            label: "Home",
            
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.card,
              colorFilter: colorFilter, // width: 33.we,
              // height: 25.he,
            ),
            icon: SvgPicture.asset(
              AppImages.card,
              colorFilter:
                  const ColorFilter.mode(AppColors.c_8D8D8D, BlendMode.srcIn),
              // width: 33.we,
              // height: 25.he,
            ),
            label: "Cards",
          ),
          BottomNavigationBarItem(
            activeIcon:
                SvgPicture.asset(AppImages.note, colorFilter: colorFilter),
            icon: SvgPicture.asset(
              AppImages.note,
              colorFilter:
                  const ColorFilter.mode(AppColors.c_8D8D8D, BlendMode.srcIn),
              // width: 25.we,
              // height: 31.he,
            ),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.profil,
              colorFilter:
                  const ColorFilter.mode(AppColors.c_FFFFFF, BlendMode.srcIn),
            ),
            icon: SvgPicture.asset(
              AppImages.profil,
              colorFilter:
                  const ColorFilter.mode(AppColors.c_8D8D8D, BlendMode.srcIn),
              // width: 25.we,
              // height: 31.he,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
