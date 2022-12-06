import 'package:intl/intl.dart';

class ConvertHelper {

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else if (value is int) {
      return double.parse(value.toString());
    }
    else {
      return value;
    }
  }

  static String toFullDate(DateTime data) {

    var date = DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(data);

    return date;
  }

  static String milisToFullDate(int milis) {

    var dateTime = DateTime.fromMillisecondsSinceEpoch(milis * 1000);

    var date = DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(dateTime);

    return date;
  }

  static String milisToHour(int milis) {
    var fixedValue = DateTime.fromMillisecondsSinceEpoch(milis * 1000);

    var dateFormat = new DateFormat('HH.mm');

    var currentDate = dateFormat.format(fixedValue);

    return currentDate;
  }

}