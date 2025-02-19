import 'package:auto_route/auto_route.dart';
import 'package:auth_module/router/auth_router.gm.dart';

const String loginRoute = '/login/';

final authRoutes = [
  CustomRoute(
    path: loginRoute,
    page: LoginRoute.page,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
];