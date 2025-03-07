import 'package:get/get.dart';
import '../../pages/01_first_style/menu/common/first_menu_page_binding.dart';
import '../../pages/01_first_style/menu/view/first_menu_page_view.dart';
import '../../pages/home/common/home_page_binding.dart';
import '../../pages/home/view/home_page_view.dart';
import 'route_names.dart';

class CafeMenuPages {
  static final List<GetPage<dynamic>> routes = [
    _homePage,
  ];

  static GetPage<dynamic> get _homePage => GetPage(
      name: CafeMenuRouteNames.homePage.path,
      page: HomePageView.new,
      binding: HomePageBinding(),
      children: [_firstStyleMenuPage]);

  static GetPage<dynamic> get _firstStyleMenuPage => GetPage(
        name: CafeMenuRouteNames.firstStyleMenuPage.path,
        page: FirstMenuPageView.new,
        binding: FirstMenuBinding(),
      );
}
