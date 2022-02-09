import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  canvasColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.black),
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
    fontSize: 18,
  )),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
);

ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xFF191A19),
    centerTitle: true,
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(fontSize: 18, color: Colors.white),
  ),
  canvasColor: Color(0xFF191A19),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
);
