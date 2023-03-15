import 'package:app22_23/screens/profile/widget/profile_widget.dart';
import 'package:app22_23/screens/profile/profile_settings_view.dart';
import 'package:app22_23/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import '../../model/user.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoaded = false;
  late User user;

  @override
  void initState() {
    UserPreferences.fetchUserID("3pW6VlYEvR6CfFdRcztp").then((value) => {
          if (mounted)
            {
              setState(() {
                isLoaded = true;
                user = value;
              })
            }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ProfileSettingsView()),
                  );
                  setState(() {});
                },
              ),
              buildName(user),
              const SizedBox(height: 34),
              buildAbout(user),
            ],
          ),
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
          ),
          Text(
            '@${user.username}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.grey,
            ),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              user.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
