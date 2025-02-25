// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'shared_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class SharedLocalizationsEs extends SharedLocalizations {
  SharedLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get something_went_wrong_title => 'Algo salió mal';

  @override
  String get try_again_later_description => 'Inténtalo más tarde.';

  @override
  String get understood_button_text => 'Entendido';

  @override
  String get just_now => 'Justo ahora';

  @override
  String minutes_ago(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Hace $minutes minutos',
      one: 'Hace 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String hours_ago(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'Hace $hours horas',
      one: 'Hace 1 hora',
    );
    return '$_temp0';
  }

  @override
  String get yesterday => 'Ayer';

  @override
  String weekday(String weekday) {
    return '$weekday';
  }

  @override
  String day_month(int day, String month) {
    return '$day de $month';
  }

  @override
  String day_month_year(int day, String month, int year) {
    return '$day de $month de $year';
  }
}
