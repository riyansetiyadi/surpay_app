import 'package:intl/intl.dart';

String formatMoneyNumber(int number) {
  return NumberFormat.decimalPattern('id').format(number);
}

String formatRekening(String input, {String separator = ' '}) {
  String cleaned = input.replaceAll(RegExp(r'\D'), '');
  String formatted = cleaned.replaceAllMapped(
    RegExp(r".{1,4}"),
    (match) => "${match.group(0)}$separator",
  );
  return formatted.trim();
}
