import 'package:flutter/foundation.dart';
import 'package:online_talky/src/common/constants.dart';
import 'package:online_talky/src/model/form_data.dart';

@immutable
class User {
  final String userName;
  final String email;
  final String avatarUrl;
  final String twitterProfile;
  final String linkedInProfile;
  final String phoneNumber;

  const User({
    @required this.userName,
    @required this.email,
    @required this.avatarUrl,
    @required this.twitterProfile,
    @required this.linkedInProfile,
    @required this.phoneNumber,
  });

  factory User.formFormData(FormData formData) {
    return User(
        avatarUrl: kProfilePicUrl,
        userName: formData.name,
        email: formData.email,
        phoneNumber: kPhoneNumber,
        linkedInProfile: kLinkedInProfile,
        twitterProfile: kTwitterProfile);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          userName == other.userName &&
          email == other.email &&
          avatarUrl == other.avatarUrl &&
          twitterProfile == other.twitterProfile &&
          linkedInProfile == other.linkedInProfile &&
          phoneNumber == other.phoneNumber;

  @override
  int get hashCode =>
      userName.hashCode ^
      email.hashCode ^
      avatarUrl.hashCode ^
      twitterProfile.hashCode ^
      phoneNumber.hashCode ^
      linkedInProfile.hashCode;

  @override
  String toString() {
    return 'User{userName: $userName, email: $email, avatarUrl: $avatarUrl, twitterProfile: $twitterProfile, linkedInProfile: $linkedInProfile, phoneNumber: $phoneNumber}';
  }
}
