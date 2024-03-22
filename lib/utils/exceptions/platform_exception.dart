class CPlatfromException implements Exception {
  final String code;

  CPlatfromException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'invalid-arguments':
        return 'Invalid arguments provided to the authentication methord.';
      case 'invalid-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-phone-number':
        return 'The provided phone number is invalid';
      case 'operation-not-allowed':
        return 'The sign-in provider is disabled for the firebase project.';
      case 'session-cookie-expired':
        return 'The firebase session cookie has expired. Please Sign in again.';
      case 'uid-already-exists':
        return 'The provider user ID is already in use by another user.';
      case 'sign-in-failed':
        return 'Sign in failed. Please try again.';
      case 'network-request-failed':
        return 'Network request failes. Please check your internet connection.';
      case 'internet-error':
        return 'Internet error. Please try again later.';
      case 'invalid-verification-code':
        return 'Invalid verification code. try again later.';
      default:
        return 'Plateform exception error occured.  ';
    }
  }
}
