import 'package:cafe_menu_temp/lib/src/pages/02_second_style/admin/admin_page/view/widget/admin_category_chip_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/scaffold.dart';
import '../../../../../infrastructure/utils/constants.dart';
import '../controller/admin_controller.dart';

class AdminPage extends GetView<AdminController> {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: Directionality(
            textDirection: TextDirection.rtl, child: _body(context)),
        showEndDrawer: true,
        appbar: _appBar(context),
      );

  AppBar _appBar(BuildContext context) => AppBar(
        toolbarHeight: 60,
        title: Text(
          'پنل کاربری ادمین',
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

  Widget _body(BuildContext context) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('دسته بندی منو'),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () =>
                          controller.showAddCategoryDialog(context),
                      child: Text('اضافه کردن دسته بندی'),
                    ),
                  ],
                ),
                Obx(() => controller.isLoading.value
                    ? CircularProgressIndicator()
                    : AdminCoffeeChipSelectorStyle2(
                        onEdit: (e) => controller.showEditCategoryDialog(
                          context: context,
                          item: e,
                        ),
                        onDelete: (e) => controller.showDeleteCategoryDialog(
                          id: e.id,
                          context: context,
                        ),
                        onSelected: (value) {
                          controller.selectedCategory.value = value;
                          //controller.getItems(value.id);
                        },
                        options: controller.coffeeOptions.reversed.toList(),
                        selectedId: controller.selectedCategory.value?.id,
                      )),

                /*  TextButton(
                  onPressed: () => controller.showEditCategoryDialog(context),
                  child: Text('edit category'),
                ),*/
              ],
            ),
          ),
        ),
      );
}
