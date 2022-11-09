import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:app22_23/screens/profile/widget/appbar_widget.dart';
import 'package:app22_23/screens/profile/widget/button_widget.dart';
import 'package:app22_23/screens/profile/widget/profile_widget.dart';
import 'package:app22_23/screens/profile/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

import '../../model/user.dart';
import '../../utils/user_preferences.dart';

// Settings for the profile
class ProfileSettingsView extends StatefulWidget {
  const ProfileSettingsView({super.key});

  @override
  _ProfileSettingsViewState createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends State<ProfileSettingsView> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
      child: Builder(
          builder: (context) => Scaffold(
                appBar: buildAppBar(context),
                body: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ProfileWidget(
                      imagePath: user.imagePath,
                      isEdit: true,
                      onClicked: () {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                        label: 'Full Name',
                        text: user.name,
                        onChanged: (name) => user = user.copy(name: name)),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Username',
                      text: user.username,
                      onChanged: (username) =>
                          user = user.copy(username: username),
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'About',
                      text: user.about,
                      maxLines: 5,
                      onChanged: (about) => user = user.copy(about: about),
                    ),
                    const SizedBox(height: 24),
                    ButtonWidget(
                      text: 'Save',
                      onClicked: () {
                        UserPreferences.setUser(user);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              )));
}
