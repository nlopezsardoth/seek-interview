import 'package:auth_module/data/models/pin.dart';
import 'package:auth_module/l10n/auth_localizations.dart';
import 'package:auth_module/presentation/widgets/pin_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pinput/pinput.dart';
import 'package:formz/formz.dart';

void main() {
  late AuthLocalizations localizations;

  Future<void> pumpPinInputField(WidgetTester tester, {
    String? label,
    required FormzInput<String, PinValidationError> pin,
    String? errorMessage,
    required void Function(String) onChanged,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AuthLocalizations.localizationsDelegates,
        supportedLocales: AuthLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            localizations = AuthLocalizations.of(context)!;
            return Scaffold(
              body: PinInputField(
                label: label,
                pin: pin,
                errorMessage: errorMessage,
                onChanged: onChanged,
              ),
            );
          },
        ),
      ),
    );
  }

  group('PinInputField Widget Test', () {
    testWidgets(
      'GIVEN a PinInputField WHEN rendered THEN it should be visible',
      (WidgetTester tester) async {
        await pumpPinInputField(
          tester,
          pin: Pin.pure(),
          onChanged: (_) {},
        );

        expect(find.byType(Pinput), findsOneWidget);
      },
    );

    testWidgets(
      'GIVEN a label WHEN PinInputField is rendered THEN it should display the label',
      (WidgetTester tester) async {
        const testLabel = 'Enter PIN';

        await pumpPinInputField(
          tester,
          label: testLabel,
          pin: Pin.pure(),
          onChanged: (_) {},
        );

        expect(find.text(testLabel), findsOneWidget);
      },
    );

    testWidgets(
      'GIVEN an invalid pin WHEN PinInputField is rendered THEN it should display an error message',
      (WidgetTester tester) async {
        await pumpPinInputField(
          tester,
          pin: Pin.dirty(""),
          onChanged: (_) {},
        );

        expect(find.text(localizations.login_invalid_pin), findsOneWidget);
      },
    );

    testWidgets(
      'GIVEN user input WHEN typing a pin THEN onChanged should be called with correct value',
      (WidgetTester tester) async {
        String inputValue = '';

        await pumpPinInputField(
          tester,
          pin: Pin.pure(),
          onChanged: (value) => inputValue = value,
        );

        await tester.enterText(find.byType(Pinput), '1234');
        await tester.pump();

        expect(inputValue, '1234');
      },
    );
  });
}
