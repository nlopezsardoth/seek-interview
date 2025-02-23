import 'package:auth_module/presentation/blocs/auth/auth_bloc.dart';
import 'package:auth_module/presentation/blocs/login/login_bloc.dart';
import 'package:auth_module/presentation/views/views.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_module/config/router_locator.dart';
import 'package:router_module/router/routes/home_router.dart';
import 'package:router_module/router/seek_router.dart';
import 'package:shared_module/ui_utils/overlay/loading_status_overlay.dart';
import 'package:shared_module/widgets/seek_loader.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthBloc -> Redirect if authenticated
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState.status == AuthStatus.authenticated) {
          routerLocator<SeekRouter>().go(homeRoute);
        }
      }, // LoginBloc -> Manage different flows
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return LoadingStatusOverlay(
            loadingStatusCubit: context.read<LoginBloc>().loadingStatus,
            errorBottomSheetStatus:
                context.read<LoginBloc>().errorBottomSheetStatus,
            child: Scaffold(body: _selectLoginView(context, state)),
          );
        },
      ),
    );
  }

  Widget _selectLoginView(BuildContext context, LoginState state) {
    // Return different views based on login flow
    switch (state.flow) {
      case LoginFlow.setNewPin:
        return PinAuthView();
      case LoginFlow.requireBiometric:
        return BiometricAuthView();
      case LoginFlow.requirePin:
        return PinAuthView();
      default:
        return SeekLoader();
    }
  }
}
