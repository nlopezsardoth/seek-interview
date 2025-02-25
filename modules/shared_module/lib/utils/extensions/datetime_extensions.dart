import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toFriendlyString() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return Intl.message("Justo ahora", name: "just_now");
    } else if (difference.inMinutes < 60) {
      return Intl.plural(
        difference.inMinutes,
        one: "Hace 1 minuto",
        other: "Hace ${difference.inMinutes} minutos",
        name: "minutes_ago",
        args: [difference.inMinutes],
        examples: {"minutes": 5},
      );
    } else if (difference.inHours < 24) {
      return Intl.plural(
        difference.inHours,
        one: "Hace 1 hora",
        other: "Hace ${difference.inHours} horas",
        name: "hours_ago",
        args: [difference.inHours],
        examples: {"hours": 3},
      );
    } else if (difference.inDays == 1) {
      return Intl.message("Ayer", name: "yesterday");
    } else if (difference.inDays < 7) {
      return Intl.message(
        weekdayName,
        name: "weekday",
        args: [weekdayName],
        examples: {"weekday": "Lunes"},
      );
    } else if (year == now.year) {
      return Intl.message(
        "$day de $monthName",
        name: "day_month",
        args: [day, monthName],
        examples: {"day": 10, "month": "Mayo"},
      );
    } else {
      return Intl.message(
        "$day de $monthName de $year",
        name: "day_month_year",
        args: [day, monthName, year],
        examples: {"day": 10, "month": "Mayo", "year": 2023},
      );
    }
  }

  String get monthName {
    const months = [
      "Enero",
      "Febrero",
      "Marzo",
      "Abril",
      "Mayo",
      "Junio",
      "Julio",
      "Agosto",
      "Septiembre",
      "Octubre",
      "Noviembre",
      "Diciembre",
    ];
    return months[month - 1];
  }

  String get weekdayName {
    const weekdays = [
      "Lunes",
      "Martes",
      "Miércoles",
      "Jueves",
      "Viernes",
      "Sábado",
      "Domingo",
    ];
    return weekdays[weekday - 1];
  }
}
