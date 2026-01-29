import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _UserLoginState();
}

class _UserLoginState extends State<MenuPage> {
  List<String> x = ["Main", "Appetizers", "Sides", "Drinks", "Desserts"];
  bool _customIcon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Main Menu'),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: x.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 1
                )
              )
            ),

            child: ExpansionTile(
              backgroundColor: const Color.fromARGB(144, 255, 166, 64),

              leading: CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/img/${x[index]}.png')
              ),

              title: Text(
                x[index],
                style: const TextStyle(
                  fontSize: 20
                )
              ),

                children: const [
                  ListTile(
                    title: Text(
                      "- Spagetti Carbonara",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "- Angus Beef Burger",
                      style: TextStyle(fontSize: 17),
                    )
                  )
                ],

              onExpansionChanged: (bool expanded){
                setState(() =>
                  _customIcon = expanded,
                );
              }
            )
          );
        }
      )
    );
  }
}