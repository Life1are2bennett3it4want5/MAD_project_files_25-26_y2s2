import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //dine in icon
            SizedBox(
              height: 150,
              width: 150,
              child: GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, "/ordermenu"),
                },
                child: const Card(
                  color: Color.fromARGB(200,224,224,224),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text(
                          "Dine in",
                          style: TextStyle(
                            fontSize: 18
                          )
                        ),
                        Icon(
                          IconData(0xe296, fontFamily:'MaterialIcons'),
                          size: 100
                        )
                      ],
                    )
                  )
                )
              )
            ),

            //Delivery icon
            SizedBox(
              height: 150,
              width: 150,
              child: GestureDetector(
                onTap: () => {

                },
                child: const Card(
                  color: Color.fromARGB(200,224,224,224),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text(
                          "Delivery",
                          style: TextStyle(
                            fontSize: 18
                          )
                        ),
                        Icon(
                          IconData(0xe40a, fontFamily:'MaterialIcons'),
                          size: 100
                        )
                      ],
                    )
                  ),
                  
                )
              )
            ),

          ],
        )
      )
    );
  }
}
