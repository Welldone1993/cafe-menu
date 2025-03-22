import 'route_paths.dart';

class Routes {
  final String uri;
  final String path;

  const Routes(this.uri, [final String? path]) : path = path ?? uri;
}

class CafeMenuRouteNames extends Routes {
  CafeMenuRouteNames(super.uri);

  /// home Page
  static const Routes homePage = Routes(
    RoutePaths.homePage,
    RoutePaths.homePage,
  );

  static const Routes firstStyleMenuPage = Routes(
    RoutePaths.homePage + RoutePaths.firstStyleMenuPage,
    RoutePaths.firstStyleMenuPage,
  );

  static const Routes secondStyleMenuPage = Routes(
    RoutePaths.homePage + RoutePaths.secondStyleMenuPage,
    RoutePaths.secondStyleMenuPage,
  );
}
