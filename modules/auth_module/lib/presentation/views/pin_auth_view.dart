import 'package:auth_module/l10n/auth_localizations.dart';
import 'package:auth_module/presentation/blocs/login/login_bloc.dart';
import 'package:auth_module/presentation/widgets/pin_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/utils/extensions/context_extensions.dart';
import 'package:shared_module/widgets/seek_button.dart';

class PinAuthView extends StatelessWidget {
  const PinAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final bool isNewPinFlow = state.flow == LoginFlow.setNewPin;
        final ln10Auth = AuthLocalizations.of(context);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                isNewPinFlow
                    ? ln10Auth!.login_new_pin_title
                    : ln10Auth!.login_pin_auth_title,
                style: context.theme.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              PinInputField(
                label: isNewPinFlow ? ln10Auth.login_new_pin_sub_title : null,
                pin: state.pin,
                errorMessage: state.errorMessage,
                onChanged:
                    (value) => context.read<LoginBloc>().add(PinChanged(value)),
              ),
              SizedBox(height: 25),
              SeekButton(
                label: ln10Auth.login_continue,
                onPressed: () {
                  context.read<LoginBloc>().add(
                    isNewPinFlow
                        ? SetupNewPin()
                        : LoginWithPin(
                          ln10Auth.login_confirm_pin_dont_match_message,
                        ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
