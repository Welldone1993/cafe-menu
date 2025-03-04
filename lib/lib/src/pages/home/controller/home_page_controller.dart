import 'package:get/get.dart';

class HomePageController extends GetxController {
  Rx<int> quantity = 1.obs;
  Rx<double> total = 30.25.obs;

  void add() {
    quantity.value = quantity.value + 1;
    total.value = 30.25 * quantity.value;
  }

  void remove() {
    if (quantity.value > 1) {
      quantity.value = quantity.value - 1;
      total.value = 30.25 * quantity.value;
    }
  }
}
