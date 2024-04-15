// ignore_for_file: unreachable_switch_case

class CFirebaseAuthException implements Exception {
  //* Error Code associated with the exception
  final String code;

  //*Contruction that takes on error code.
  CFirebaseAuthException(this.code);

  //* Get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email is already registered. please use a deffrent email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The passeword is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been desabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'invalid verification code. Please enter a valid code.';
      case 'invalid-verificatin-id':
        return 'Invalid verification ID. Please request new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exists':
        return 'This Email already exists. Please use a deffrent email.';
      case 'provider-already-linked':
        return 'The account is linked with another provider.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a deffrent user account';
      case 'user-mismatch':
        return 'The supplied credential do not correnspond to the previously signed user.';
      case 'account-exists-with-deffrent-credentials':
        return 'An account already exist with the same email but diffrent sign-in credential.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact Support for assistance.';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.';
      case 'invalid-action-code':
        return 'The action code is invalid. Please check the action code and try again.';
      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid missing code.';
      case 'user-tocken-expired':
        return 'The user\'s token has expired, and authentication is required, Please sign in again.';
      case 'user-not-found':
        return 'No user found in the given email or UID.';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'wrong-password':
        return 'The password is invalid. Please check your password and try again.';
      case 'user-tocken-revoked':
        return 'The user\'s token has been revoked. Please sign in again.';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';
      case 'invalid-sender':
        return 'The email sender template is invalid. Please verify the sender\'s email.';
      default:
        return 'Something went wrong';
    }
  }
}
