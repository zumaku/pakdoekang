import 'package:intl/intl.dart';

class DateConverter {
  static String convert(DateTime date) {
    if (DateTime.now().day == date.day) {
      return "Hari ini - ${date.hour}:${date.minute}";
    } else if (DateTime.now().day - 1 == date.day) {
      return "Kemarin - ${date.hour}:${date.minute}";
    } else if (DateTime.now().day + 1 == date.day) {
      return "Besok - ${date.hour}:${date.minute}";
    } else {
      return "${DateFormat('d MMM').format(date)} - ${date.hour}:${date.minute}";
    }
  }
}
