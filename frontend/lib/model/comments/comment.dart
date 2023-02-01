import 'dart:ffi';
import 'package:app22_23/model/user.dart';

Comment NULL_COMMENT = Comment(
    0,
    0,
    0,
    const User(
        imagePath: "missingNo",
        name: "name",
        username: "username",
        email: "email",
        about: "about",
        isDarkMode: false),
    "");

class Comment {
  bool loaded = false;
  int id;
  int value;
  int date;
  User user;
  String comment;

  Comment(this.id, this.value, this.date, this.user, this.comment) {}
}
