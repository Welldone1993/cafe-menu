import 'package:get/get.dart';

import '../controller/first_menu_controller.dart';

class FirstMenuBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(FirstMenuController.new);
}
