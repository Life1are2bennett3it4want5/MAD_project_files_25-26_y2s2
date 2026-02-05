import 'package:flutter/material.dart';
import 'pages/menu.dart';
import 'pages/order.dart';
import 'pages/delivery.dart';
import 'pages/account.dart';
import 'pages/billpage.dart';
import 'pages/nav_index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _pages = const [
    MenuPage(),
    Order(),
    Delivery(),
    Account(),
    BillPage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: navIndex,
      builder: (context, index, _) {
        return Scaffold(
          body: IndexedStack(
            index: index,
            children: _pages,
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
            child: NavigationBar(
              selectedIndex: index,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.menu_book), label: "Menu"),
                NavigationDestination(icon: Icon(Icons.receipt), label: "Order"),
                NavigationDestination(icon: Icon(Icons.delivery_dining), label: "Delivery"),
                NavigationDestination(icon: Icon(Icons.login), label: "Account"),
                NavigationDestination(icon: Icon(Icons.receipt), label: "Bill"),
              ],
              backgroundColor: const Color.fromRGBO(255, 192, 0, 1),
              height: 80,
              onDestinationSelected: (int newIndex) {
                navIndex.value = newIndex;
              },
            ),
          ),
        );
      },
    );
  }
}
