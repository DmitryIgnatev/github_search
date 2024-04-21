import 'dart:developer';

import 'package:intl/intl.dart';

class DateTimeService {
  static String formatIso8601ToCustom(String iso8601String) {
    try {
      DateTime dateTime = DateTime.parse(iso8601String);
      String formattedDate =
          DateFormat('dd.MM.yyyy HH:mm').format(dateTime.toLocal());
      return formattedDate;
    } catch (e) {
      log('Error parsing date: $e');
      throw Exception('Error parsing date: $e');
    }
  }
}
