import 'package:auth_module/core/config/auth_locator.dart';
import 'package:auth_module/l10n/auth_localizations.dart';
import 'package:auth_module/presentation/blocs/auth/auth_bloc.dart';
import 'package:auth_module/presentation/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/core/home_locator.dart';
import 'package:home_module/l10n/home_localizations.dart';
import 'package:home_module/presentation/blocs/qr/qr_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:router_module/config/router_locator.dart';
import 'package:router_module/router/app_router.dart';
import 'package:shared_module/config/environments/environment.dart';
import 'package:shared_module/config/shared_locator.dart';
import 'package:shared_module/l10n/shared_localizations.dart';
import 'package:shared_module/themes/theme.dart';
import 'package:shared_module/ui_utils/overlay/loading_overlay_content.dart';

const _appName = 'Seek app';

Future<void> runCore(Flavor environment) async {
  Environment.setUpEnv(environment);
  await _initLocators();

  runApp(_SeekApp());
}

Future<void> _initLocators() async {
  await initSharedLocator();
  await initRouterLocator();
  await initAuthLocator();
  await initHomeLocator();
}

class _SeekApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => authLocator<AuthBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => authLocator<LoginBloc>(),
        ),
        BlocProvider<QrBloc>(
          create: (_) => homeLocator<QrBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: _appName,
        theme: lightTheme.getTheme(),
        routerConfig: AppRouter().config(),
        localizationsDelegates: const [
          ...AuthLocalizations.localizationsDelegates,
          ...SharedLocalizations.localizationsDelegates,
          ...HomeLocalizations.localizationsDelegates,
        ],
        supportedLocales: const [
          ...AuthLocalizations.supportedLocales,
          ...SharedLocalizations.supportedLocales,
          ...HomeLocalizations.supportedLocales
        ],
        builder:
            (_, child) => GlobalLoaderOverlay(
              overlayWidgetBuilder: (_) {
                return const LoadingOverlayContent(displayOverlay: true);
              },
              child: child!,
            ),
      ),
    );
  }
}
