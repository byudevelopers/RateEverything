import 'package:app22_23/screens/profile/widget/appbar_widget.dart';
import 'package:app22_23/screens/tab_view.dart';
import 'package:app22_23/styles/button_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app22_23/model/user.dart';
import 'package:app22_23/utils/user_preferences.dart';
import '../profile/widget/textfield_widget.dart';


class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  late User user;
  void initState() {
    super.initState();
    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: TextFieldWidget(
                label: 'Full Name',
                text: user.name,
                onChanged: (name) => user = user.copy(name: name)),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: TextFieldWidget(
              label: 'Username',
              text: user.username,
              onChanged: (username) => user = user.copy(username: username),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ElevatedButton(
                style: ButtonStyles.normal(context),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TabView();
                      },
                    ),
                  );
                },
                child: Text("Create")),
          )
        ],
      ),
    );
  }
}
