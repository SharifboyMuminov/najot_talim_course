import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../moduls/card_modul.dart';
import '../moduls/contact_model.dart';
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
    isShowNumer: false,
  ),
  CardModul(
    isShowNumer: false,
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

List<String> myCardsButtonText = ["Settings", "Transactions"];
List<RecentTransactions> myCardRecentTransactions = [
  RecentTransactions(
      icon: AppImages.note,
      bacgoundColor: AppColors.c_6A6A6A,
      money: '0',
      title: "View Statement"),
  RecentTransactions(
      icon: AppImages.xx,
      bacgoundColor: AppColors.c_6A6A6A,
      money: '0',
      title: "Change Pin"),
  RecentTransactions(
      icon: AppImages.minus,
      bacgoundColor: AppColors.c_6A6A6A,
      money: '0',
      title: "Remove Card"),
];

List<RecentTransactions> yesterdayInofModuls = [
  RecentTransactions(
    icon: AppImages.arro,
    bacgoundColor: const Color(0xFFEAF5DC),
    money: "",
    title: "Fund Transferred",
    colorFilter: const ColorFilter.mode(
      Color(0xFF45661B),
      BlendMode.srcIn,
    ),
  ),
  RecentTransactions(
    icon: AppImages.note,
    bacgoundColor: const Color(0xFFECECEC),
    money: "",
    title: "Mobile Bill",
    colorFilter: const ColorFilter.mode(
      Color(0xFF5F5F5F),
      BlendMode.srcIn,
    ),
  ),
  RecentTransactions(
    icon: "assets/icons/money.svg",
    bacgoundColor: const Color(0xFFD3EAFF),
    money: "",
    title: "Salary",
  ),
  RecentTransactions(
    icon: AppImages.note,
    bacgoundColor: const Color(0xFFE7DFFF),
    money: "",
    title: "Card Payment",
    colorFilter: const ColorFilter.mode(
      Color(0xFF4829A8),
      BlendMode.srcIn,
    ),
  ),
];

List<ContacModul> contacts = [
  ContacModul(
    imge: AppImages.image2,
    name: "Aliya",
  ),
  ContacModul(
    imge: AppImages.image3,
    name: "Calira",
  ),
  ContacModul(
    imge: AppImages.image4,
    name: "Bob",
  ),
  ContacModul(
    imge: AppImages.image5,
    name: "Samy",
  ),
  ContacModul(
    imge: AppImages.image6,
    name: "Sara",
  ),
];
