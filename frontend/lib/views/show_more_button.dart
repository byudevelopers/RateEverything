import 'package:flutter/material.dart';

class ShowMoreButton extends StatefulWidget {
  ShowMoreButton({Key? key}) : super(key: key);

  @override
  State<ShowMoreButton> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<ShowMoreButton> {
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.yellow),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )
        )
      ),
      child: Text(
        'Show More ($count)',
        style: const TextStyle(color: Colors.black),
      ),
      onPressed: () {
        setState(() {
          count += 1;
        });
      },
        
      );
  }
}
