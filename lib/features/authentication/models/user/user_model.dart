
import 'package:ecommerce/utils/formatter/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //* helpere function to get full name
  String get fullName => '$firstName $lastName';

  //* helper function to formate phone number
  String get formattedPhoneNo => CFormatter.formatPhoneNumber(phoneNumber);

  //* Static function to split full name into first and last name
  static List<String> namePart(fullName) => fullName.split(" ");

  //* Static function to generate a username from the full Name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camalCaseUsername = "$firstName$lastName";
    String usernamedWithPrefix = "cwt_$camalCaseUsername";
    return usernamedWithPrefix;
  }

  //* static function to create a empty User model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  //* Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  //* Factory methord to create a userModel form a Firebase document snapshot
  // factory UserModel.fromSnapShot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(
  //       id: document.id,
  //       firstName: data['FirstName'] ?? '',
  //       lastName: data['LastName'] ?? '',
  //       username: data['Username'] ?? '',
  //       email: data['Email'] ?? '',
  //       phoneNumber: data['phoneNumber'] ?? '',
  //       profilePicture: data['profilePicture'] ?? '',
  //     );
  //   }
  // }
}
