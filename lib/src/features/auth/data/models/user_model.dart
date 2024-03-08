

import 'package:json_annotation/json_annotation.dart';
import 'package:roadradar/src/features/auth/domain/entity/user.dart';
part 'user_model.g.dart';
@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required String uid,
    required String about,
    required String name,
    required String email,
    required String mobileNo,
    required String profilePicUrl
  }) : super(
    uid: uid,
    about: about,
    name: name,
    email: email,
    mobileNo: mobileNo,
    profilePicUrl: profilePicUrl
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}