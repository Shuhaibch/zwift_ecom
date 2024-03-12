import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formateCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }

  //* not fully tested
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // remove any non digit characher from the phone number
    var digitOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digit Only
    String countyCode = '+${digitOnly.substring(0, 2)}';
    digitOnly = digitOnly.substring(2);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countyCode)');

    int i = 0;
    while (i < digitOnly.length) {
      int groupLenght = 2;
      if (i == 0 && countyCode == '+1') {
        groupLenght = 3;
      }

      int end = i + groupLenght;
      formattedNumber.write(digitOnly.substring(i, end));

      if (end < digitOnly.length) {
        formattedNumber.write(' ');
      }

      i = end;
    }
    return digitOnly;
  }
}
