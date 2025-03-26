import 'package:cafe_menu_temp/lib/src/pages/02_second_style/menu/view/widget/category_chip_builder.dart';
import 'package:cafe_menu_temp/lib/src/pages/02_second_style/menu/view/widget/category_item.dart';
import 'package:cafe_menu_temp/lib/src/pages/02_second_style/menu/view/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/scaffold.dart';
import '../../../../infrastructure/routes/route_names.dart';
import '../../../../infrastructure/utils/constants.dart';
import '../controller/second_menu_controller.dart';

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
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer()),
          )
        ],
      );

  TextStyle _textStyle() => TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: Constants.iranSansFaNumFont,
      color: Colors.white);

  Widget _body() => Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(color: Color(0xff313131)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Constants.largeHorizontalSpacer,
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xffc67c4e),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.tune,
                                  color: Colors.white,
                                ),
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
                      ],
                    ),
                  ),
                  // این Container بخش سفید زیر بنر را ایجاد می‌کند
                  SizedBox(
                    height: 65,
                  ),
                ],
              ),
              // بنر که در بین دو پس‌زمینه قرار می‌گیرد
              Positioned(
                top: 70, // نصف روی مشکی، نصف روی سفید
                left: 16,
                right: 16,
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade300,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage('assets/banner.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Promo',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 16,
                        child: Text(
                          'Buy one get one FREE',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            backgroundColor: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'دسته بندی ها',
            ),
          ),
          CoffeeChipSelectorStyle2(
            onSelected: (value) {
              controller.selectedCategory.value = value;
              //controller.getItems(int.parse(value.id));
            },
            options: controller.coffeeOptions.reversed.toList(),
            selectedId: controller.selectedCategory.value?.id,
          ),
          Constants.largeVerticalSpacer,
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.9,
              ),
              itemCount: controller.selectedCategoryItems.value.length,
              itemBuilder: (context, index) {
                final item = controller.selectedCategoryItems.value[index];
                return CategoryItem(
                    item: item,
                    onTabDetails: () => Get.toNamed(
                          CafeMenuRouteNames.secondStyleDetailsPage.uri,
                          parameters: {'id': item.id.toString()},
                        ));
              },
            ),
          )
        ],
      ));
}
