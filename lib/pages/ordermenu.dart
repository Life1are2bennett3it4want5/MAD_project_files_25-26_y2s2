import 'package:flutter/material.dart';

class OrderMenuPage extends StatefulWidget {
  const OrderMenuPage({super.key});
  @override
  State<OrderMenuPage> createState() => _UserLoginState();
}

class _UserLoginState extends State<OrderMenuPage> {
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
              backgroundColor: Colors.lightBlueAccent,

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

              trailing: Icon(
                _customIcon ? Icons.arrow_drop_down_circle: Icons.arrow_drop_down),

              children: const [
                ListTile(
                  title: Text("Spagetti Carbonara"),
                ),
                ListTile(
                  title: Text("Angus Beef Burger")
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