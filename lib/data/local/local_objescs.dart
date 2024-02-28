import 'package:default_project/data/models/categori/categori_modeul.dart';
import 'package:default_project/data/models/task/task_modul.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../models/onboading/onboading_modul.dart';

List<OnboadingModul> onboadingModuls = [
  OnboadingModul(
      image: AppImages.onboadingIameOne,
      subTitle:
          "You can easily manage all of your daily tasks in DoMe for free",
      title: "Manage your tasks"),
  OnboadingModul(
      image: AppImages.onboadingIameTwo,
      subTitle:
          "In Uptodo  you can create your personalized routine to stay productive",
      title: "Create daily routine"),
  OnboadingModul(
      image: AppImages.onboadingIameThree,
      subTitle:
          "You can organize your daily tasks by adding your tasks into separate categories",
      title: "Orgonaize your tasks"),
];

List<CategoriModul> categiries = [
  CategoriModul(
      color: const Color(0xFFCCFF80),
      icon: "assets/icons/gracery.svg",
      title: "Grocery"),
  CategoriModul(
      color: const Color(0xFFFF9680),
      icon: "assets/icons/work.svg",
      title: "Work"),
  CategoriModul(
      color: const Color(0xFF80FFFF),
      icon: "assets/icons/sport.svg",
      title: "Sport"),
  CategoriModul(
      color: const Color(0xFF80FFD9),
      icon: "assets/icons/design.svg",
      title: "Design"),
  CategoriModul(
      color: const Color(0xFF809CFF),
      icon: "assets/icons/university.svg",
      title: "University"),
  CategoriModul(
      color: const Color(0xFFFF80EB),
      icon: "assets/icons/social.svg",
      title: "Social"),
  CategoriModul(
      color: const Color(0xFFFC80FF),
      icon: "assets/icons/music.svg",
      title: "Music"),
  CategoriModul(
      color: const Color(0xFF80FFA3),
      icon: "assets/icons/health.svg",
      title: "Health"),
  CategoriModul(
      color: const Color(0xFF80D1FF),
      icon: "assets/icons/movie.svg",
      title: "Movie"),
  CategoriModul(
      color: const Color(0xFFFFCC80),
      icon: "assets/icons/categoriy_home.svg",
      title: "Home"),
];

List<TaskModul> tasks = [];
