import 'package:intl/intl.dart';

extension Formatter on double {
  String get currencyFormat =>
      NumberFormat.currency(symbol: '₦', decimalDigits: 0).format(this);
}
