import 'package:cafe_menu_temp/lib/src/pages/02_second_style/menu/view/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/scaffold.dart';
import '../../../../infrastructure/utils/constants.dart';
import '../controller/second_menu_controller.dart';
import 'widget/category_item.dart';

class SecondMenuPageView extends GetView<SecondMenuController> {
  const SecondMenuPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        showEndDrawer: true,
        appbar: _appBar(context),
      );

  AppBar _appBar(BuildContext context) => AppBar(
        toolbarHeight: 60,
        title: Text(
          'منو شماره 2',
          style: _textStyle(),
        ),
        backgroundColor: Color(0xff313131),
        centerTitle: true,
        actions: [
          Builder(
            builder: (BuildContext context) => IconButton(
                icon: const Icon(
                  Icons.menu,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer()),
          )
        ],
      );

  TextStyle _textStyle() => TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: Constants.iranSansFaNumFont,
      color: Colors.white);

  Widget _body() => Obx(
        () => Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(color: Color(0xff313131)),
              child: Row(
                children: [
                  Constants.largeHorizontalSpacer,
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: Color(0xffc67c4e),
                        borderRadius: BorderRadius.circular(12)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.tune),
                    ),
                  ),
                  Expanded(
                    child: SearchBarWidget(
                      textController: controller.searchTextController,
                      hint: 'جستجو',
                    ),
                  ),
                ],
              ),
            ),
            Constants.largeVerticalSpacer,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'دسته بندی ها',
                style: _textStyle(),
              ),
            ),
            Constants.largeVerticalSpacer,
            /*CoffeeChipSelector(
              onSelected: (value) {
                controller.selectedCategory.value = value;
                controller.getItems(value.id);
              },
              options: controller.coffeeOptions.reversed.toList(),
              selectedId: controller.selectedCategory.value!.id,
            ),*/
            Constants.largeVerticalSpacer,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  ...controller.selectedCategoryItems.value.map(
                    (e) => CategoryItem(item: e),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
