import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:app22_23/screens/profile/widget/appbar_widget.dart';
import 'package:app22_23/screens/profile/widget/button_widget.dart';
import 'package:app22_23/screens/profile/widget/profile_widget.dart';
import 'package:app22_23/screens/profile/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../model/user.dart';
import '../../utils/user_preferences.dart';
import 'package:http/http.dart' as http;

// Settings for the profile
class ProfileSettingsView extends StatefulWidget {
  const ProfileSettingsView({super.key});

  @override
  _ProfileSettingsViewState createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends State<ProfileSettingsView> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = fetchData();
  }

  fetchData() async {
    return await UserPreferences.fetchUser();
  }

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
                      onClicked: () async {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);

                        if (image == null) return;
                        final directory =
                            await getApplicationDocumentsDirectory();
                        final name = basename(image.path);
                        final imageFile = File('${directory.path}/$name');
                        final newImage =
                            await File(image.path).copy(imageFile.path);

                        setState(
                            () => user = user.copy(imagePath: newImage.path));
                      },
                    ),
                    const SizedBox(height: 24),
                    FutureBuilder(
                      future: fetchData(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data.toString());
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const Text("Loading");
                      }),
                    ),
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
