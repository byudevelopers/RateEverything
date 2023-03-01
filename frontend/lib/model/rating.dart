import 'package:flutter/material.dart';

class Rating {
  final int _id;
  final String username;
  final Icon icon;
  final String comment;

  Rating(id, this.username, this.comment)
      : _id = id,
        icon = const Icon(Icons.edit_note);
}
