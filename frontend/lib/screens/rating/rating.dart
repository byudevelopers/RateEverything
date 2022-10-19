import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Rating"),
    );
  }
}
