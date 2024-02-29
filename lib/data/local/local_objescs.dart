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
  CategoriModul(color: const Color(0xFFCCFF80), icon: "💪", title: "Work"),
  CategoriModul(color: const Color(0xFF80FFFF), icon: "👊", title: "Sport"),
  CategoriModul(color: const Color(0xFF80FFD9), icon: "🌔", title: "Design"),
  CategoriModul(
      color: const Color(0xFF809CFF), icon: "🧑‍💻", title: "University"),
  CategoriModul(color: const Color(0xFFFF80EB), icon: "🤐", title: "Social"),
  CategoriModul(color: const Color(0xFF80FFA3), icon: "❤️", title: "Health"),
  CategoriModul(color: const Color(0xFFFC80FF), icon: "⭐️", title: "Music"),
  CategoriModul(color: const Color(0xFF80D1FF), icon: "🥷", title: "Movie"),
  CategoriModul(color: const Color(0xFFFFCC80), icon: "🏙", title: "Home"),
];

List<TaskModul> tasks = [];

const List<Color> colors = [
  Color(0xFF1D1D1D),
  Colors.red,
  Colors.blue,
  Colors.orange,
  Colors.yellowAccent,
  Colors.tealAccent,
  Colors.purpleAccent,
  Colors.white10,
  Colors.pinkAccent,
  Colors.limeAccent,
  Colors.lightBlueAccent,
  Colors.deepPurpleAccent,
  Colors.blueGrey,
  Colors.lime,
  Colors.amber,
];
