import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  //TEMA LIGHT
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      //COLOR PRIMARIO
      primaryColor: Colors.indigo,
      //APPBAR THEME
      appBarTheme: AppBarTheme(
        color: primary,
        elevation: 0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.indigo,
      ),
      //TEXTBUTTON THEME
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primary),
      ));

  //TEMA DARK PUNK
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      //COLOR PRIMARIO
      primaryColor: Colors.indigo,
      //APPBAR THEME
      appBarTheme: AppBarTheme(
        color: primary,
        elevation: 0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.indigo,
      )
      //scaffoldBackgroundColor: Colors.amber,
      );
}
