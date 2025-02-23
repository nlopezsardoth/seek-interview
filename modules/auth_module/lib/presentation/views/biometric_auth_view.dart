import 'package:auth_module/l10n/auth_localizations.dart';
import 'package:auth_module/presentation/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/widgets/seek_button.dart';

class BiometricAuthView extends StatelessWidget {
  const BiometricAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LoginBloc>().add(LoginWithBiometrics());
    final ln10Auth = AuthLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: () {
              context.read<LoginBloc>().add(LoginWithBiometrics());
            }, icon: Icon(
            Icons.fingerprint,
            size: 100,
            color: Theme.of(context).primaryColor,
          ),),
          
          SizedBox(height: 40),
          Text(
            ln10Auth!.biometric_log_in_text,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          // SizedBox(height: 40),
          // SeekButton(
          //   label: ln10Auth!.login_continue,
          //   onPressed: () {
          //     context.read<LoginBloc>().add(LoginWithBiometrics());
          //   },
          // ),
        ],
      ),
    );
  }
}
