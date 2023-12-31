import 'package:auto_route/auto_route.dart';
import 'package:flutter_clean_architecture/src/config/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: ListingsRoute.page,
        ),
        AutoRoute(
          page: ListingsDetailRoute.page,
        ),
        AutoRoute(
          page: VcRoute.page,
        ),
      ];
}
