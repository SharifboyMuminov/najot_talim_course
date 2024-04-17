import 'package:get/get.dart';

class QuizController extends GetxController {
  var count = 0.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }
}
