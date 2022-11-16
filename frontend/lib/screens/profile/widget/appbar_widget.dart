import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:app22_23/themes.dart';
import 'package:app22_23/utils/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final user = UserPreferences.getUser();
  final isDarkMode = user.isDarkMode;
  const darkModeIcon = CupertinoIcons.moon_stars;

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(darkModeIcon,
              color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;

            final switcher = ThemeSwitcher.of(context);
            switcher.changeTheme(theme: theme);

            final newUser = user.copy(isDarkMode: !isDarkMode);
            UserPreferences.setUser(newUser);
          },
        ),
      ),
    ],
  );
}
