import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'auth_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AuthLocalizations
/// returned by `AuthLocalizations.of(context)`.
///
/// Applications need to include `AuthLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/auth_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AuthLocalizations.localizationsDelegates,
///   supportedLocales: AuthLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AuthLocalizations.supportedLocales
/// property.
abstract class AuthLocalizations {
  AuthLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AuthLocalizations? of(BuildContext context) {
    return Localizations.of<AuthLocalizations>(context, AuthLocalizations);
  }

  static const LocalizationsDelegate<AuthLocalizations> delegate = _AuthLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('es')
  ];

  /// No description provided for @login_validate_your_identity_title.
  ///
  /// In es, this message translates to:
  /// **'Valida tu identidad'**
  String get login_validate_your_identity_title;

  /// No description provided for @login_continue.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get login_continue;

  /// No description provided for @login_keyboard_done_button.
  ///
  /// In es, this message translates to:
  /// **'Listo'**
  String get login_keyboard_done_button;

  /// No description provided for @login_invalid_pin.
  ///
  /// In es, this message translates to:
  /// **'PIN inválido'**
  String get login_invalid_pin;

  /// No description provided for @login_new_pin_title.
  ///
  /// In es, this message translates to:
  /// **'Crea tu PIN'**
  String get login_new_pin_title;

  /// No description provided for @login_new_pin_sub_title.
  ///
  /// In es, this message translates to:
  /// **'Crea un PIN de 4 dígitos, lo necesitarás para ingresar a tu app.'**
  String get login_new_pin_sub_title;

  /// No description provided for @login_pin_auth_title.
  ///
  /// In es, this message translates to:
  /// **'Ingresa tu PIN'**
  String get login_pin_auth_title;

  /// No description provided for @login_confirm_pin_dont_match_message.
  ///
  /// In es, this message translates to:
  /// **'El PIN no coincide, inténtalo nuevamente.'**
  String get login_confirm_pin_dont_match_message;

  /// No description provided for @login_try_with_pin_button_label.
  ///
  /// In es, this message translates to:
  /// **'Trata con PIN'**
  String get login_try_with_pin_button_label;

  /// No description provided for @biometric_auth_reason_ios.
  ///
  /// In es, this message translates to:
  /// **'¿Deseas permitir que Seek use tu huella o rostro?'**
  String get biometric_auth_reason_ios;

  /// No description provided for @biometric_auth_reason_android.
  ///
  /// In es, this message translates to:
  /// **'¿Deseas permitir que Seek use tu huella?'**
  String get biometric_auth_reason_android;

  /// No description provided for @biometric_log_in_text.
  ///
  /// In es, this message translates to:
  /// **'Ingresar con rostro o huella'**
  String get biometric_log_in_text;

  /// No description provided for @biometric_auth_android_sign_in_title.
  ///
  /// In es, this message translates to:
  /// **'Ingresa rápido y seguro a tu cuenta.'**
  String get biometric_auth_android_sign_in_title;

  /// No description provided for @biometric_auth_try_again_button_label.
  ///
  /// In es, this message translates to:
  /// **'Trata de nuevo'**
  String get biometric_auth_try_again_button_label;

  /// No description provided for @biometric_auth_android_biometric_hint.
  ///
  /// In es, this message translates to:
  /// **'Coloca tu huella en el sensor.'**
  String get biometric_auth_android_biometric_hint;

  /// No description provided for @error_biometric_modal_error_title.
  ///
  /// In es, this message translates to:
  /// **'No logramos identificar tus datos biométricos'**
  String get error_biometric_modal_error_title;

  /// No description provided for @error_biometric_modal_error_description.
  ///
  /// In es, this message translates to:
  /// **'Tu clave fue correcta, pero no pudimos validar tu biometría.'**
  String get error_biometric_modal_error_description;

  /// No description provided for @error_biometric_modal_updated_title.
  ///
  /// In es, this message translates to:
  /// **'Algo cambió en tus datos biométricos'**
  String get error_biometric_modal_updated_title;

  /// No description provided for @error_biometric_modal_updated_description.
  ///
  /// In es, this message translates to:
  /// **'Para poder ingresar a tu app es necesario que te identifiques nuevamente.'**
  String get error_biometric_modal_updated_description;

  /// No description provided for @error_biometric_modal_info_description.
  ///
  /// In es, this message translates to:
  /// **'Para ingresar a tu cuenta con tus factores de reconocimiento biométrico deberás ir a los ajustes de tu dispositivo.'**
  String get error_biometric_modal_info_description;

  /// No description provided for @error_biometric_modal_info_title.
  ///
  /// In es, this message translates to:
  /// **'Acceso a tu rostro y huella'**
  String get error_biometric_modal_info_title;
}

class _AuthLocalizationsDelegate extends LocalizationsDelegate<AuthLocalizations> {
  const _AuthLocalizationsDelegate();

  @override
  Future<AuthLocalizations> load(Locale locale) {
    return SynchronousFuture<AuthLocalizations>(lookupAuthLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AuthLocalizationsDelegate old) => false;
}

AuthLocalizations lookupAuthLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es': return AuthLocalizationsEs();
  }

  throw FlutterError(
    'AuthLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
