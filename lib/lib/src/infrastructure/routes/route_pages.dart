import 'package:cafe_menu_temp/lib/src/pages/02_second_style/details/common/details_binding.dart';
import 'package:get/get.dart';

import '../../pages/01_first_style/menu/common/first_menu_page_binding.dart';
import '../../pages/01_first_style/menu/view/first_menu_page_view.dart';
import '../../pages/02_second_style/details/view/details_page_view.dart';
import '../../pages/02_second_style/menu/common/second_menu_page_binding.dart';
import '../../pages/02_second_style/menu/view/second_menu_page_view.dart';
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
        children: [
          _firstStyleMenuPage,
          _secondStyleMenuPage,
        ],
      );

  static GetPage<dynamic> get _firstStyleMenuPage => GetPage(
        name: CafeMenuRouteNames.firstStyleMenuPage.path,
        page: FirstMenuPageView.new,
        binding: FirstMenuBinding(),
      );

  static GetPage<dynamic> get _secondStyleMenuPage => GetPage(
        name: CafeMenuRouteNames.secondStyleMenuPage.path,
        page: SecondMenuPageView.new,
        binding: SecondMenuBinding(),
        children: [
          _secondStyleDetailsPage,
        ],
      );

  static GetPage<dynamic> get _secondStyleDetailsPage => GetPage(
        name: CafeMenuRouteNames.secondStyleDetailsPage.path,
        page: DetailsPageView.new,
        binding: DetailsBinding(),
      );
}
