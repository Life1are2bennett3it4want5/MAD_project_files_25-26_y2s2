import "package:flutter/material.dart";

//define theme data as a variable called primaryTheme
ThemeData primaryTheme = ThemeData(
//theme parameter in MaterialApp defines a style for all files
    scaffoldBackgroundColor: Colors.white,
    //automatic styling for appbar
    appBarTheme: const AppBarTheme(
      shape: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 1,
        )
      ),
      backgroundColor: Color.fromRGBO(255,120,0,1),
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
        ));