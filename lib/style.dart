import 'package:flutter/material.dart';

var theme = ThemeData(
  iconTheme: const IconThemeData(color: Colors.blue),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.black,
  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom()),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 1,
    titleTextStyle: TextStyle(color: Colors.black),
    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.red)),
);
