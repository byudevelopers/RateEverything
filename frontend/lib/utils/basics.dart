import 'dart:io';

import 'package:flutter/material.dart';

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
