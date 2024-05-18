import 'package:flutter/material.dart';

class AppIcons {
  static const Icon telegram = Icon(
    Icons.telegram,
    color: Color(0xff00ffd5),
    size: 30,
  );

  static const String homeImagePath = 'assets/images/gettopik.png';

  static Widget gettopik({
    double width = 30.0,
    double height = 30.0,
    BoxFit fit = BoxFit.contain,
  }) {
    return Image.asset(
      homeImagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }

  static const Icon devContact = Icon(
    Icons.message,
    color: Color(0xff00ffd5),
    size: 30,
  );

  static const Icon otherApps = Icon(
    Icons.app_shortcut,
    color: Color(0xff00ffd5),
    size: 30,
  );
}
