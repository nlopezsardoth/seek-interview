import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'shared_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of SharedLocalizations
/// returned by `SharedLocalizations.of(context)`.
///
/// Applications need to include `SharedLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/shared_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SharedLocalizations.localizationsDelegates,
///   supportedLocales: SharedLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the SharedLocalizations.supportedLocales
/// property.
abstract class SharedLocalizations {
  SharedLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SharedLocalizations? of(BuildContext context) {
    return Localizations.of<SharedLocalizations>(context, SharedLocalizations);
  }

  static const LocalizationsDelegate<SharedLocalizations> delegate = _SharedLocalizationsDelegate();

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

  /// No description provided for @something_went_wrong_title.
  ///
  /// In es, this message translates to:
  /// **'Algo salió mal'**
  String get something_went_wrong_title;

  /// No description provided for @try_again_later_description.
  ///
  /// In es, this message translates to:
  /// **'Inténtalo más tarde.'**
  String get try_again_later_description;

  /// No description provided for @understood_button_text.
  ///
  /// In es, this message translates to:
  /// **'Entendido'**
  String get understood_button_text;
}

class _SharedLocalizationsDelegate extends LocalizationsDelegate<SharedLocalizations> {
  const _SharedLocalizationsDelegate();

  @override
  Future<SharedLocalizations> load(Locale locale) {
    return SynchronousFuture<SharedLocalizations>(lookupSharedLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_SharedLocalizationsDelegate old) => false;
}

SharedLocalizations lookupSharedLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es': return SharedLocalizationsEs();
  }

  throw FlutterError(
    'SharedLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
