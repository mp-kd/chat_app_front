import 'package:flutter/material.dart';

class ChatAppThemes {
  static ThemeData get defaultTheme {
    return ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.red,
        primaryTextTheme: TextTheme(
            button: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            caption: TextStyle(
              color: Colors.white,
            )),
        accentTextTheme: TextTheme(
            button: TextStyle(
              color: Colors.grey,
            ),
            caption: TextStyle(
              color: Colors.grey,
            )));
  }
}
