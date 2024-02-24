import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import 'card_screen/card_screen.dart';
import 'home_screen/home_screen.dart';
import 'profil_screen/profil_screen.dart';
import 'transactions_screen/transactions_screen.dart';

class TabBoxTwo extends StatefulWidget {
  const TabBoxTwo({super.key});

  @override
  State<TabBoxTwo> createState() => _TabBoxTwoState();
}

class _TabBoxTwoState extends State<TabBoxTwo> {
  List<Widget> _screens = [];
  int _activScreen = 0;
  ColorFilter colorFilter =
      const ColorFilter.mode(AppColors.c_FFFFFF, BlendMode.srcIn);

  @override
  void initState() {
    _screens = const [
      HomeScreen(),
      CaardScreen(),
      TransactionsScreen(),
      ProfilScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _activScreen,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _activScreen,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (newActiveIndex) {
          _activScreen = newActiveIndex;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.home,
              colorFilter: colorFilter,
            ),
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
              colorFilter: colorFilter,
              // width: 33.we,
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
            activeIcon: SvgPicture.asset(
              AppImages.note,
              colorFilter: colorFilter,
            ),
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
              colorFilter: colorFilter,
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
