import 'package:formz/formz.dart';

enum PinValidationError { empty, toShort }

class Pin extends FormzInput<String, PinValidationError> {
  const Pin.pure() : super.pure('');
  const Pin.dirty([super.value = '']) : super.dirty();

  @override
  PinValidationError? validator(String value) {
    if (value.isEmpty) return PinValidationError.empty;
    if (value.length < 4) return PinValidationError.toShort;
    return null;
  }
}