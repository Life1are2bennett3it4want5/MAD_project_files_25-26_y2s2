import "package:flutter/material.dart";

//define theme data as a variable called primaryTheme
ThemeData primaryTheme = ThemeData(
//theme parameter in MaterialApp defines a style for all files
    scaffoldBackgroundColor: const Color.fromARGB(255, 221, 189, 247),
    //automatic styling for appbar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 112, 78, 142),
      foregroundColor: Colors.black,
      centerTitle: true,
    ),
    //to use a text theme
    //style: Theme.of(context).textTheme.bodyMedium/bodySmall
    textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 12,
          color: Color.fromRGBO(230, 30, 30, 1),
        ),
        bodyMedium: TextStyle(
          fontSize: 25,
          color: Color.fromRGBO(124, 68, 159, 1),
        )));