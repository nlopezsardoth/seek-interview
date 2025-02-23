// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AuthLocalizationsEs extends AuthLocalizations {
  AuthLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get login_validate_your_identity_title => 'Valida tu identidad';

  @override
  String get login_continue => 'Continuar';

  @override
  String get login_keyboard_done_button => 'Listo';

  @override
  String get login_invalid_pin => 'PIN inválido';

  @override
  String get login_new_pin_title => 'Crea tu PIN';

  @override
  String get login_new_pin_sub_title => 'Crea un PIN de 4 dígitos, lo necesitarás para ingresar a tu app.';

  @override
  String get login_pin_auth_title => 'Ingresa tu PIN';

  @override
  String get login_confirm_pin_dont_match_message => 'El PIN no coincide, inténtalo nuevamente.';

  @override
  String get biometric_auth_reason_ios => '¿Deseas permitir que Seek use tu huella o rostro?';

  @override
  String get biometric_auth_reason_android => '¿Deseas permitir que Seek use tu huella?';

  @override
  String get biometric_log_in_text => 'Ingresar con rostro o huella';

  @override
  String get biometric_auth_android_sign_in_title => 'Ingresa rápido y seguro a tu cuenta.';

  @override
  String get biometric_auth_android_biometric_hint => 'Coloca tu huella en el sensor.';

  @override
  String get error_biometric_modal_error_title => 'No logramos identificar tus datos biométricos';

  @override
  String get error_biometric_modal_error_description => 'Tu clave fue correcta, pero no pudimos validar tu biometría.';

  @override
  String get error_biometric_modal_updated_title => 'Algo cambió en tus datos biométricos';

  @override
  String get error_biometric_modal_updated_description => 'Para poder ingresar a tu app es necesario que te identifiques nuevamente.';

  @override
  String get error_biometric_modal_info_description => 'Para ingresar a tu cuenta con tus factores de reconocimiento biométrico deberás ir a los ajustes de tu dispositivo.';

  @override
  String get error_biometric_modal_info_title => 'Acceso a tu rostro y huella';
}
