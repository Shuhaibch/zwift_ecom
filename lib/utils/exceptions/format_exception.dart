// ignore_for_file: unreachable_switch_case

class CFormatException implements Exception {
  //* Error Code associated with the exception
  final String message;

  //* Default constructor with a generic error message.

  const CFormatException(
      [this.message =
          'An unexpected format error occured. Please check your input.']);

  //* Create a format exception from a specific error message
  factory CFormatException.fromMessage(String message) {
    return CFormatException(message);
  }

  //* Get Corresponding error message
  String get formattedMessage => message;

  //* Create a format exception from a specific error code.
  factory CFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const CFormatException(
            'The email address formate is invalid, Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const CFormatException(
            'The provided phone number format is invalid. Please enter a valid number');
      case 'invalid-date-format':
        return const CFormatException(
            'The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const CFormatException(
            'The URL format is incvalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const CFormatException(
            'The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const CFormatException('Input should be valid numeric format.');
      
      default:
        return const CFormatException('Invalid format occured.');
        
    }
  }
}
