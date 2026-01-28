import 'package:flutter/material.dart';

class OrderSummaries extends StatefulWidget {
  const OrderSummaries({super.key});

  @override
  State<OrderSummaries> createState() => _OrderSummariesState();
}

class _OrderSummariesState extends State<OrderSummaries> {
  List<String> x = ["Main","Appetizers","Sides","Drinks","Desserts"];
  List<String> y = ["1","2","3","4","5"];
  bool _customIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
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
              leading: CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/img/${x[index]}.png')
              ),

              title: Text(
                "Order ${y[index]}",
                style: const TextStyle(
                  fontSize: 20
                )
              ),

              trailing: Icon(
                _customIcon ? Icons.arrow_drop_down_circle: Icons.arrow_drop_down),

                children: const [
                  ListTile(
                    title: Text(
                      '''
                      Cheeseburger
                      - Original Fries
                      - Fried Oysters
                      - Ginger Ale
                      - Coffee Pudding

                      Table 37
                      ''',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
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