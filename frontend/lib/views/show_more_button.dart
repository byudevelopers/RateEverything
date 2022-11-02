import 'package:flutter/material.dart';

class ShowMoreButton extends StatefulWidget {
  ShowMoreButton({Key? key}) : super(key: key);

  @override
  State<ShowMoreButton> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<ShowMoreButton> {
  int count = 5;
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      // style: ButtonStyle(),
      child: Text(
        'Show More ($count)',
        style: TextStyle(fontSize: 25),
      ),
      onPressed: () { 
        count += 5;
      },
        
      );
  }
}
