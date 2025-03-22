import 'package:get/get.dart';

import '../controller/second_menu_controller.dart';

class SecondMenuBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(SecondMenuController.new);
}
