import 'package:intl/intl.dart';

class DateConverter {
  static String convert(DateTime date) {
    if (DateTime.now() == date) {
      return "Hari ini - ${date.hour}:${date.minute}";
    } else if (DateTime.now().day - 1 == date.day &&
        DateTime.now().month == date.month) {
      return "Kemarin - ${date.hour}:${date.minute}";
    } else if (DateTime.now().day + 1 == date.day &&
        DateTime.now().month == date.month) {
      return "Besok - ${date.hour}:${date.minute}";
    } else {
      return "${DateFormat('d MMM').format(date)} - ${date.hour}:${date.minute}";
    }
  }
}
