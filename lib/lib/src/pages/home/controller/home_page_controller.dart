import 'package:cafe_menu_temp/lib/src/pages/home/model/item_view_model.dart';
import 'package:get/get.dart';

import '../repository/home_page_repository.dart';

class HomePageController extends GetxController {
  final HomePageRepository _repository = HomePageRepository();

  Rx<int> quantity = 1.obs;
  Rx<double> total = 30.25.obs;

  Rxn<ItemViewModel> item = Rxn();

  @override
  void onInit() {
    showMenuItem(2);
    super.onInit();
  }

  void showMenuItem(final int id) {
    item.value = _repository.getMenuItem(id);
    quantity.value = 1;
    total.value = item.value!.pricePerQuantity;
  }

  void add() {
    quantity.value = quantity.value + 1;
    total.value = item.value!.pricePerQuantity * quantity.value;
  }

  void remove() {
    if (quantity.value > 1) {
      quantity.value = quantity.value - 1;
      total.value = item.value!.pricePerQuantity * quantity.value;
    }
  }

  void nextItem(final int id) {
    if (id == _repository.items.length + 1) {
      return;
    }
    showMenuItem(id);
  }

  void previousItem(final int id) {
    if (id == 0) {
      return;
    }
    showMenuItem(id);
  }
}
