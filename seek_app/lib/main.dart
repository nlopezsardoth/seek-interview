import 'package:flutter/material.dart';
import 'package:router_module/router/app_router.dart';
import 'package:shared_module/config/environments/environment.dart';
import 'package:shared_module/themes/theme.dart';


const _appName = 'Seek app';

Future<void> runCore(Flavor environment) async {
  Environment.setUpEnv(environment);
} 

void main() {
  runApp(const _SeekApp());
}

class _SeekApp extends StatelessWidget {
  const _SeekApp();

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: _appName,
          theme: SeekTheme.lightTheme,
          darkTheme: SeekTheme.darkTheme,
          themeMode: ThemeMode.system,
          routerConfig: AppRouter().config(),
    );
  }
}
