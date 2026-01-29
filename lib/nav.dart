import 'package:flutter/material.dart';
import 'pages/menu.dart';
import 'pages/order.dart';
import 'pages/delivery.dart';
import 'pages/account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _index = 0;
  final _pages = const [MenuPage(), Order(), Delivery(), Account(), ];
  static const IconData settings = IconData(0xe57f, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _index,
          children: _pages,
        ),

        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black,
                width: 1,
              )
            )
          ),

          child: NavigationBar(
            selectedIndex: _index,
            
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.menu_book),
                label: "Menu",
              ),
              NavigationDestination(
                icon: Icon(Icons.receipt),
                label: "Order",
              ),
              NavigationDestination(
                icon: Icon(Icons.delivery_dining),
                label: "Delivery",
              ),
              NavigationDestination(
                icon: Icon(Icons.login),
                label: "Account",
              ),
              NavigationDestination(
                icon: Icon(settings),
                label: "Settings",
              )
            ],

            backgroundColor: const Color.fromRGBO(255,192,0,1),
            height: 80,
            onDestinationSelected: (int index) {
              setState(() {
                _index = index;
              });
            },
          ),
        ));
  }
}
