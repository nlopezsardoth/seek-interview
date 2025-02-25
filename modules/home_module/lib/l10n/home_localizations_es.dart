// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'home_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class HomeLocalizationsEs extends HomeLocalizations {
  HomeLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get scan_qr_code_button_text => 'Escanear QR';

  @override
  String get scanned_code_data_label => 'Data del QR: ';

  @override
  String get scan_history_label => 'Historial de escaneado';

  @override
  String get no_scan_history_label => 'Todavía no tienes QRs escaneados';

  @override
  String get list_tile_label => 'Escaneado en: ';

  @override
  String get clear_history_label => 'Limpiar historial';

  @override
  String get error_qr_modal_info_title => 'Intentalo de nuevo';

  @override
  String get error_qr_modal_info_description => 'Hubo un error escaneando tu QR.';
}
