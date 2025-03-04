import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lib/src/infrastructure/app_controller/app_controller.dart';
import 'lib/src/infrastructure/routes/route_pages.dart';

class CafeMenu extends StatelessWidget {
  const CafeMenu({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        onInit: AppController().initializeApp,
        getPages: [
          ...CafeMenuPages.routes,
        ],
        initialRoute: '/home',
        debugShowCheckedModeBanner: true,
      );
}
