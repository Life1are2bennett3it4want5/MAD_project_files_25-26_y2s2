import 'package:flutter/material.dart';
import 'package:project/startuppage.dart';
import 'nav.dart';
import 'theme.dart';
import 'pages/orderdetails.dart';
import 'pages/ordermenu.dart';
import 'pages/login/stafflogin.dart';
import 'pages/StaffPages/orderSummaries.dart';
import 'pages/mappage.dart';

void main(){
  runApp( MaterialApp(
      home: const StartupPage(),
      theme: primaryTheme,
      routes: {
        "/mainpage": (context) => const LoginPage(),
        "/orderdetails": (context) => const OrderDetails(),
        "/ordermenu": (context)=> const OrderMenuPage(),
        "/stafflogin": (context) => const StaffLogin(),
        "/ordersummaries": (context) => const OrderSummaries(),
        "/location": (context) => const MapPage(),
      }
    )
  );
}