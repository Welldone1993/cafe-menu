import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/image_builder.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructure/utils/constants.dart';
import '../controller/first_menu_controller.dart';
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
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: Constants.iranSansFaNumFont,
          ),
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

  Widget _body() => Column(
        children: [
          SearchBarWidget(
            textController: TextEditingController(),
            title: 'search',
            hint: 'search text',
          )
        ],
      );
}
