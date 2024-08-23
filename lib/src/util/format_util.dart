import 'package:intl/intl.dart';

class FormatUtil {
  static String formatDouble(double value) {
    var formatNumber = NumberFormat("###,###,##0.00");
    return formatNumber.format(value);
  }
}
