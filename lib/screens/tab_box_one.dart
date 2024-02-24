import 'package:default_project/screens/card_screen/card_screen.dart';
import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:default_project/screens/profil_screen/profil_screen.dart';
import 'package:default_project/screens/transactions_screen/transactions_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabBoxOne extends StatefulWidget {
  const TabBoxOne({super.key});

  @override
  State<TabBoxOne> createState() => _TabBoxOneState();
}

class _TabBoxOneState extends State<TabBoxOne> {
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
      body: _screens[_activScreen],
      bottomNavigationBar: Container(
        color: AppColors.c_000000,
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          currentIndex: _activScreen,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          onTap: (newActiveIndex) {
            _activScreen = newActiveIndex;
            setState(() {});
          },
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
      ),
    );
  }
}
