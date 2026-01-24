import 'package:flutter/material.dart';
import 'package:project/pages/orderingservice.dart';
import 'navbar.dart';
import 'theme.dart';
import 'pages/orderdetails.dart';

void main(){
  runApp( MaterialApp(
      home: const LoginPage(),
      theme: primaryTheme,
      routes: {
        "/orderdetails": (context) => const OrderDetails(),
      }
    )
  );
}