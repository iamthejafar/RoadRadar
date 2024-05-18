// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      about: json['about'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      mobileNo: json['mobileNo'] as String,
      profilePicUrl: json['profilePicUrl'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'about': instance.about,
      'name': instance.name,
      'email': instance.email,
      'mobileNo': instance.mobileNo,
      'profilePicUrl': instance.profilePicUrl,
    };
