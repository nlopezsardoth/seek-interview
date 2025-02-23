import 'package:auto_route/auto_route.dart';
import 'package:home_module/router/home_router.gm.dart';

const String homeRoute = '/home';

final homeRoutes = [
  AutoRoute(
    path: homeRoute,
    page: HomeRoute.page,
  ),
];