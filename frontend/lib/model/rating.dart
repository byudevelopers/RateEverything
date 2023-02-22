import 'package:flutter/material.dart';

class Rating {
  late int value;
  late String username;
  late Icon icon;
  late String comment;

  Rating(this.value, this.username, this.comment) {
    icon = const Icon(Icons.edit_note);
  }
}
