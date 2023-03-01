import 'dart:io';

import 'package:flutter/material.dart';

import '../../model/user.dart';

/// Widget that truncates long text unless tapped on
///
/// Accepts [text] and cuts it off with [cuttoff]
class CondensedText extends StatefulWidget {
  final String text;
  final int charCutoff;
  final int nlCutoff;

  const CondensedText(
      {Key? key, required this.text, this.charCutoff = 200, this.nlCutoff = 4})
      : super(key: key);

  @override
  State<CondensedText> createState() => _CondensedTextState();
}

/// State for CondensedText
class _CondensedTextState extends State<CondensedText> {
  bool condensable = false;
  late bool condensed = true;
  late String conString = "";

  @override
  void initState() {
    super.initState();

    Iterable<Match> nlMatches = '\n'.allMatches(widget.text);

    if (widget.text.length > widget.charCutoff) {
      conString = '${widget.text.substring(0, widget.charCutoff)}…';
      condensable = true;
      condensed = true;
    } else if (widget.nlCutoff < nlMatches.length + 1) {
      int index = nlMatches.elementAt(widget.nlCutoff - 1).start - 1;
      conString = '${widget.text.substring(0, index)}…';
      condensable = true;
      condensed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return condensable
        ? InkWell(
            onTap: () {
              setState(() {
                condensed = !condensed && condensable;
              });
            },
            child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, top: 5, right: 10, bottom: 0),
                    child: Text(condensed ? conString : widget.text))))
        : Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 5, top: 5, right: 10, bottom: 0),
                child: Text(widget.text)));
  }
}

/// Creates widget with User image and name
///
/// Put's image left, then user's name then @username
class UserFrameWidget extends StatelessWidget {
  final User? user;
  final TextStyle nameStyle;
  final TextStyle usernameStyle;
  final Widget? child;

  const UserFrameWidget(
      {Key? key,
      required this.user,
      this.child,
      this.nameStyle = const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 01),
      this.usernameStyle = const TextStyle(
          color: Color.fromARGB(255, 100, 100, 100), fontSize: 12)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // IMAGE
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: user != null
            ? buildImage(user!.imagePath, 32, 32)
            : const SizedBox(
                width: 32,
                height: 32,
              ),
      ),

      // USERNAME
      Expanded(
          child: Column(children: [
        const SizedBox(height: 12),
        Row(
          children: [
            //const SizedBox(width: 10),
            Text(user?.name ?? "        ", style: nameStyle),
            const SizedBox(width: 5),
            Text(
              user == null ? '...' : '@${user?.username}',
              style: usernameStyle,
            ),
          ],
        ),

        //CHILD
        child ?? const Text(""),
      ]))
    ]);
  }
}

Widget buildImage(String imagePath, double width, double height,
    {Widget? child}) {
  final image = imagePath.contains('https://')
      ? NetworkImage(imagePath)
      : FileImage(File(imagePath));

  return ClipOval(
    child: Material(
      color: Colors.transparent,
      child: Ink.image(
        image: image as ImageProvider,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    ),
  );
}
