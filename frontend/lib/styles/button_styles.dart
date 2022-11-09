import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle normal(BuildContext context) {
    return ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
        return TextStyle(
          fontSize: 20,
          color: Theme.of(context)
              .buttonTheme
              .colorScheme!
              .tertiary, // doesn't seem to do anything, if you want to change the color, to it on the text() inline
        );
      }),
      shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
          (Set<MaterialState> states) {
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0));
      }),
      minimumSize:
          MaterialStateProperty.resolveWith<Size>((Set<MaterialState> states) {
        return const Size(220, 50);
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).buttonTheme.colorScheme!.primary;
          } else if (states.contains(MaterialState.disabled)) {
            return Theme.of(context).buttonTheme.colorScheme!.secondary;
          } else {
            return Theme.of(context).buttonTheme.colorScheme!.primary;
          }
        },
      ),
    );
  }

  static ButtonStyle small(BuildContext context) {
    return ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
        return TextStyle(
          fontSize: 20,
          color: Theme.of(context).buttonTheme.colorScheme!.tertiary,
        );
      }),
      shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
          (Set<MaterialState> states) {
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0));
      }),
      minimumSize:
          MaterialStateProperty.resolveWith<Size>((Set<MaterialState> states) {
        return const Size(100, 50);
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).buttonTheme.colorScheme!.primary;
          } else if (states.contains(MaterialState.disabled)) {
            return Theme.of(context).buttonTheme.colorScheme!.secondary;
          } else {
            return Theme.of(context).buttonTheme.colorScheme!.primary;
          }
        },
      ),
    );
  }


}
