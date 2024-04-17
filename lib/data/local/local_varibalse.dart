import 'package:default_project/data/models/quiz/quiz_model.dart';
import 'package:flutter/animation.dart';

List<QuizModel> localQuizs = [
  QuizModel(
    request: "Ko'p gap eshakka ...",
    alphabet: "ydfusdfks".split(""),
    countText: "3",
    trueAnswer: "yuk",
  ),
  QuizModel(
    request: "Kam kam huram hamisha ...",
    alphabet: "hdfusrfmksa".split(""),
    countText: "3",
    trueAnswer: "huram",
  ),
  QuizModel(
    request: "Dunyo bir kundir uham ...",
    alphabet: "hrfusbgumdnfai".split(""),
    countText: "3",
    trueAnswer: "bugundir",
  ),
];

late AnimationController globalAnimationController;
bool isStartAnimation = false;
