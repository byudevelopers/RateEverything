import 'package:app22_23/model/user.dart';

class UserPreferences {
  static const myUser = User(
    imagePath: 'https://www.w3schools.com/howto/img_avatar.png',
    name: 'John Doe',
    username: 'johndoe',
    email: 'john.doe@gmail.com',
    about:
        'I like to rate things and this is my favorite app. Follow me for my hot takes!',
    isDarkMode: false,
  );
}
