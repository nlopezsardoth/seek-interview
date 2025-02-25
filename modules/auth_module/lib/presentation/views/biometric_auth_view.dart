import 'package:auth_module/domain/entities/biometric_auth_parameters.dart';
import 'package:auth_module/l10n/auth_localizations.dart';
import 'package:auth_module/presentation/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/utils/extensions/context_extensions.dart';
import 'package:shared_module/widgets/seek_button.dart';

class BiometricAuthView extends StatelessWidget {
  const BiometricAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final ln10Auth = AuthLocalizations.of(context);
    final biometricParams = BiometricAuthParams(
      title: ln10Auth!.biometric_log_in_text,
      subtitle: ln10Auth.biometric_auth_android_sign_in_title,
    );

    context.read<LoginBloc>().add(LoginWithBiometrics(biometricParams));

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              context.read<LoginBloc>().add(
                LoginWithBiometrics(biometricParams),
              );
            },
            icon: Icon(
              Icons.fingerprint,
              size: 100,
              color: context.theme.primaryColor,
            ),
          ),

          SizedBox(height: 30),
          Text(
            ln10Auth.biometric_log_in_text,
            style: context.theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SeekButton(
                label: ln10Auth.biometric_auth_try_again_button_label,
                onPressed: () {
                  context.read<LoginBloc>().add(
                    LoginWithBiometrics(biometricParams),
                  );
                },
              ),
              SizedBox(width: 20),
              SeekButton(
                label: ln10Auth.login_try_with_pin_button_label,
                onPressed: () {
                  context.read<LoginBloc>().add(GoToLoginWithPin());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
