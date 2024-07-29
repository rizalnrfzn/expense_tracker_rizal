import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

class Utils {
  static String idCurrencyFormatter(double amount) {
    MoneyFormatter fmf = MoneyFormatter(amount: amount);
    String idFormatter = fmf
        .copyWith(
          symbol: 'IDR',
          thousandSeparator: '.',
          fractionDigits: 0,
        )
        .output
        .symbolOnLeft
        .toString();

    return idFormatter;
  }

  static List<DateTime> getFirstAndLastDayOfWeek() {
    final now = DateTime.now();

    int currentWeekday = now.weekday;

    DateTime firstDayOfWeek = now.subtract(Duration(days: currentWeekday));
    DateTime lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));

    return [firstDayOfWeek, lastDayOfWeek];
  }

  static String formatWeekRange(
      DateTime firstDayOfWeek, DateTime lastDayOfWeek) {
    String formattedFirstDay = DateFormat.d().format(firstDayOfWeek);
    String formattedLastDay = DateFormat.d().format(lastDayOfWeek);

    String formattedFirstMonth = DateFormat.MMM().format(firstDayOfWeek);
    String formattedLastMonth = DateFormat.MMM().format(lastDayOfWeek);

    String formatterFirstYear = DateFormat.y().format(firstDayOfWeek);
    String formatterLastYear = DateFormat.y().format(lastDayOfWeek);

    return '$formattedFirstDay $formattedFirstMonth $formatterFirstYear - $formattedLastDay $formattedLastMonth $formatterLastYear';
  }

  static String getFormattedWeekRange() {
    List<DateTime> firstAndLastDayOfWeek = getFirstAndLastDayOfWeek();
    return formatWeekRange(
      firstAndLastDayOfWeek[0],
      firstAndLastDayOfWeek[1],
    );
  }

  static String convertedDateTimeToString(DateTime date) {
    String year = date.year.toString();

    String month = date.month.toString();
    if (month.length == 1) {
      month = '0$month';
    }

    String day = date.day.toString();
    if (day.length == 1) {
      day = '0$day';
    }

    String yyyymmdd = '$day-$month-$year';

    return yyyymmdd;
  }
}
