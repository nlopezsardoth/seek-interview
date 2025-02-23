import 'package:auth_module/presentation/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_module/router.dart';
import 'package:router_module/router/config/router_locator.dart';
import 'package:router_module/router/seek_router.dart';
import 'package:shared_module/widgets/seek_loader.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.flow == LoginFlow.requirePin ||
            state.flow == LoginFlow.requireBiometric ||
            state.flow == LoginFlow.setNewPin) {
          routerLocator<SeekRouter>().go(loginRoute);
        }
      },
      child: Scaffold(body: SeekLoader()),
    );
  }
}
