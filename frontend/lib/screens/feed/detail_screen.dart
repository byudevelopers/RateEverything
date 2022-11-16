import 'package:app22_23/model/rating.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Rating rating;
  const DetailScreen({Key? key, required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: Center(
        child: Column(children: [
          Text(rating.username),
          Text(rating.comment),
        ]),
      ),
    );
  }
}
