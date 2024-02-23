import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../moduls/card_modul.dart';
import '../moduls/recent_transactions.dart';

List<String> homeTexts = [
  "Transfer",
  "Bills",
  "Recharge",
  "More",
];

List<String> homeIcons = [
  AppImages.arro,
  AppImages.note,
  AppImages.phone,
  AppImages.threeDot,
];

List<CardModul> cardModuls = [
  CardModul(
    date: "01/24",
    icon: AppImages.vizaCard,
    money: "\$2,200",
    numberCard: "**3245",
    typeCard: "Visa Card",
  ),
  CardModul(
    date: "04/23",
    icon: AppImages.masterCard,
    money: "\$650",
    numberCard: "**6539",
    typeCard: "Master Card",
  ),
];

List<RecentTransactions> recents = [
  RecentTransactions(
      icon: AppImages.shopping,
      money: "-\$400",
      title: "Grocery",
      bacgoundColor: AppColors.c_FFDEE2),
  RecentTransactions(
    icon: AppImages.note,
    money: "-\$120",
    title: "IESCO Bill",
    colorFilter: ColorFilter.mode(
      const Color(0xFF46320E).withOpacity(0.80),
      BlendMode.srcIn,
    ),
    bacgoundColor: AppColors.c_FFE8CE,
  ),
];
