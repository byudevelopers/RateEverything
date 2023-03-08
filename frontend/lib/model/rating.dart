import 'package:flutter/material.dart';

class Rating {
  final int id;
  final String username;
  final int value;
  final Icon icon;
  final String comment;

  Rating(this.id, this.value, this.username, this.comment):
        icon = const Icon(Icons.edit_note);
}
