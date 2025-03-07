import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/scaffold.dart';
import '../controller/first_menu_controller.dart';
import 'widget/search_field.dart';

class FirstMenuPageView extends GetView<FirstMenuController> {
  const FirstMenuPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        showEndDrawer: true,
      );

  Widget _body() => Column(
        children: [
          // CustomSearchField(
          //   textController: TextEditingController(),
          //   title: 'search',
          //   hint: 'search text',
          // ),
          // Placeholder(),
          SearchBarWidget(
            textController: TextEditingController(),
            title: 'search',
            hint: 'search text',
          )
        ],
      );
}
