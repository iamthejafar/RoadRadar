import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{

  final String uid;
  final String about;
  final String name;
  final String email;
  final String mobileNo;
  final String profilePicUrl;


  const UserEntity({
    required this.uid,
    required this.about,
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.profilePicUrl
  });

  @override
  List < Object ? > get props {
    return [
      uid,
      about,
      name,
      email,
      mobileNo,
      profilePicUrl
    ];
  }
}