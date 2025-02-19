import 'package:flutter/material.dart';
import 'package:router_module/router/app_router.dart';
import 'package:router_module/router/seek_router.dart';


class SeekRouterImpl implements SeekRouter {
  BuildContext get context => AppRouter().navigatorKey.currentContext!;

  @override
  Future<T?> push<T extends Object?>(
    String location) async {
    return AppRouter().pushNamed(location);
  }

  @override
  void go(
    String location, ) {

    AppRouter()
      ..popUntilRoot()
      ..replaceNamed(location);
  }

  @override
  void logOutNavigation({
    bool sessionExpired = false,
  }) {
    //go(welcomeRoute);

    if (sessionExpired) {
      // _showSessionExpiredSnackBar();  //TODO: complete this
    }
  }

  // void _showSessionExpiredSnackBar() {
  //   final snackBar = SnackBar(
  //     content: Text(RouterLocalizations.of(context)!.session_expired),
  //   );
  //   ScaffoldMessenger.of(context)
  //     ..removeCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // } //TODO: complete this

  @override
  void pop<T extends Object?>([T? result]) {
    AppRouter().popForced();
  }

}