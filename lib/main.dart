import 'package:flutter/material.dart';
import 'navbar.dart';
import 'theme.dart';
import 'pages/orderdetails.dart';
import 'pages/ordermenu.dart';
import 'pages/login/stafflogin.dart';
import 'pages/StaffPages/orderSummaries.dart';

void main(){
  runApp( MaterialApp(
      home: const LoginPage(),
      theme: primaryTheme,
      routes: {
        "/orderdetails": (context) => const OrderDetails(),
        "/ordermenu": (context)=> const OrderMenuPage(),
        "/stafflogin": (context) => const StaffLogin(),
        "/ordersummaries": (context) => const OrderSummaries(),
      }
    )
  );
}