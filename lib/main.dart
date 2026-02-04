import 'package:flutter/material.dart';
import 'package:project/startuppage.dart';
import 'nav.dart';
import 'theme.dart';
import 'pages/orderdetails.dart';
import 'pages/ordermenu.dart';
import 'pages/login/stafflogin.dart';
import 'pages/ordersummarystaff.dart';
import 'pages/mappage.dart';
import 'pages/inputtable.dart';
import 'pages/login/userlogin.dart';
import 'pages/ordersummarypage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        "/tablenumber": (context) => const InputTable(),
        "/userlogin": (context) => const UserLogin(),
        "/ordersummaryuser": (context) => const OrderSummaryPage(),
      }
    )
  );
}