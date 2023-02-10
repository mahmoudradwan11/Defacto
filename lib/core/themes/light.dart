import 'package:flutter/material.dart';
var defaultColor = Colors.blue;
ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Bursh'),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      color: Colors.black,
      height: 1.3,
    ),
  ),
  fontFamily: 'Jannah',
  scaffoldBackgroundColor: Colors.white,
);