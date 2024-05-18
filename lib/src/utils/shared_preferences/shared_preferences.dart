


import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _userId = 'userId';
  static const _userName = 'user_name';
  static const _profilePic = 'profile_pic';
  static const _mobileNo = "mobileNo";
  static const _token = "token";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser({
    required String userId,
    required String token,
  }) async {
    await _preferences.setString(_userId, userId);

    await _preferences.setString(_token, token);
  }
  static Future setUserName(String? userName) async {
    await _preferences.setString(_userName, userName ?? "");
  }

  static Future setProfilePic(String profilePic) async {
    await _preferences.setString(_profilePic, profilePic);
  }


  static String get userId => _preferences.getString(_userId) ?? "";
  static String get mobileNo => _preferences.getString(_mobileNo) ?? "";
  static String get userName => _preferences.getString(_userName) ?? "";
  static String? get profilePic => _preferences.getString(_profilePic);
  static String get token => _preferences.getString(_token) ?? "";


  static Future removeProfile() async {
    await _preferences.remove(_profilePic);
  }

  static Future removeUser() async {
    await _preferences.remove(_userId);
    await _preferences.remove(_mobileNo);
    await _preferences.remove(_userName);
    await _preferences.remove(_profilePic);
  }
}
