import 'package:auto_route/auto_route.dart';

import 'package:auth_module/router/auth_router.dart';
import 'package:home_module/router/home_router.dart';
import 'package:router_module/router/routes/auth_router.dart';
import 'package:router_module/router/routes/home_router.dart';
import 'package:router_module/router/routes/shared_router.dart';
import 'package:shared_module/router/shared_router.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route', modules: [
  AuthRouter,
  HomeRouter,
  SharedRouter,
])
class AppRouter extends _$AppRouter {
  static final AppRouter _instance = AppRouter._internal();

  factory AppRouter() {
    return _instance;
  }

  AppRouter._internal();

  @override
  List<AutoRoute> get routes => [
    ...authRoutes,
    ...homeRoutes,
    ...sharedRoutes,
  ];
}