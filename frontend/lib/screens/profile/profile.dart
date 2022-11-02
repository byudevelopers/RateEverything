import 'package:app22_23/styles/button_styles.dart';
import 'package:app22_23/views/profile_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 250, top: 10),
              child: TextButton(
                style: ButtonStyles.settingsButton(context),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileSettingsView()),
                  );
                },
                child: const Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: 30.0,
                ),
              ),
            ),
            const ProfilePicture(),
            const Text("My username"), //get the users username
            const Text("My name"), //get the users name

            // SafeArea(
            //   child: Padding(
            //     padding: const EdgeInsets.only(bottom: 200),
            //     child: TabContainer(
            //       tabs: const ["Posts", "Coments"],
            //       children: [
            //         Container(
            //           child: Text("text"),
            //         ),
            //         Container(
            //           child: Text("text2"),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 125,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
        ),
      ),
    );
  }
}
