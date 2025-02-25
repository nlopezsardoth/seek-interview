import 'package:auth_module/data/models/pin.dart';
import 'package:auth_module/l10n/auth_localizations.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:formz/formz.dart';
import 'package:shared_module/utils/extensions/context_extensions.dart';

class PinInputField extends StatelessWidget {
  final String? label;
  final FormzInput<String, PinValidationError> pin;
  final String? errorMessage;
  final void Function(String) onChanged;

  const PinInputField({
    super.key,
    this.label,
    required this.pin,
    this.errorMessage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          SizedBox(
            width: 250,
            child: Text(label!, style: context.theme.textTheme.bodyMedium),
          ),
        SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Pinput(
              length: 4,
              obscureText: true,
              pinAnimationType: PinAnimationType.scale,
              onChanged: onChanged,
            ),
            if (pin.isNotValid || errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  pin.isNotValid ?_mapErrorToMessage(context, pin.error) : errorMessage ?? " ",
                  style: context.theme.textTheme.bodySmall,
                ),
              ),
          ],
        ),
      ],
    );
  }

  String _mapErrorToMessage(BuildContext context, PinValidationError? error) {
    switch (error) {
      case PinValidationError.empty:
        return AuthLocalizations.of(context)!.login_invalid_pin;
      case PinValidationError.toShort:
        return AuthLocalizations.of(context)!.login_invalid_pin;
      default:
        return "";
    }
  }
}
