import 'package:app22_23/screens/profile/widget/appbar_widget.dart';
import 'package:app22_23/screens/profile/widget/profile_widget.dart';
import 'package:app22_23/screens/profile/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

import '../../model/user.dart';
import '../../utils/user_preferences.dart';

// Settings for the profile
class ProfileSettingsView extends StatefulWidget {
  @override
  _ProfileSettingsViewState createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends State<ProfileSettingsView> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async {}),
            const SizedBox(height: 24),
            TextFieldWidget(
                label: 'Full Name', text: user.name, onChanged: (name) {}),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),
          ],
        ),
      );
}
