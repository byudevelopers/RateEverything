import 'package:app22_23/themes.dart';
import 'package:app22_23/utils/user_preferences.dart';
import 'package:app22_23/views/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = "BeRate";

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      builder: (context, myTheme) {
        return MaterialApp(
          title: title,
          theme: myTheme,
          home: TabView(),
        );
      },
    );
  }
}
