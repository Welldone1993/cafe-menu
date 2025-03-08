import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/image_builder.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructure/utils/constants.dart';
import '../controller/first_menu_controller.dart';
import 'widget/category_chip_builder.dart';
import 'widget/category_item.dart';
import 'widget/search_field.dart';

class FirstMenuPageView extends GetView<FirstMenuController> {
  const FirstMenuPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        showEndDrawer: true,
        appbar: _appBar(context),
      );

  AppBar _appBar(BuildContext context) => AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomImageBuilder(
            image: 'assets/cake.jpg',
            isAvatar: true,
          ),
        ),
        toolbarHeight: 60,
        title: Text(
          'منو شماره 1',
          style: _textStyle(),
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          )
        ],
      );

  TextStyle _textStyle() => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: Constants.iranSansFaNumFont,
      );

  Widget _body() => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'روز بخیر',
                style: _textStyle(),
              ),
            ),
            Constants.largeVerticalSpacer,
            _searchbar(),
            Constants.largeVerticalSpacer,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'دسته بندی ها',
                style: _textStyle(),
              ),
            ),
            Constants.largeVerticalSpacer,
            CoffeeChipSelector(
              onSelected: (value) {
                controller.selectedCategory.value = value;
                // TODO(welldone): handle change on category
                print(value.name);
              },
              options: controller.coffeeOptions.reversed.toList(),
              selectedId: controller.selectedCategory.value!.id,
            ),
            Constants.largeVerticalSpacer,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  ...controller.selectedCategory.value!.items.map(
                    (e) => CategoryItem(item: e),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget _searchbar() => SearchBarWidget(
        textController: controller.searchTextController,
        title: 'search',
        hint: 'search text',
      );
}
