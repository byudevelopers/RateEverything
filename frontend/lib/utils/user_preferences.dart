import 'dart:convert';
import 'package:app22_23/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';

  static const myUser = User(
    imagePath: 'https://www.w3schools.com/howto/img_avatar.png',
    name: 'John Doe',
    username: 'johndoe',
    email: 'john.doe@gmail.com',
    about:
        'I like to rate things and this is my favorite app. Follow me for my hot takes! 🔥',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
