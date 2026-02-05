import 'package:flutter/material.dart';
import 'nav_index.dart';
import 'servicefile.dart';

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
      body: Column(
          children: [
            const SizedBox(height: 20),
            const Text("Start an order", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            const SizedBox(height: 50),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //dine in icon
                  SizedBox(
                    height: 85,
                    width: 375,
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.pushNamed(context, "/location"),
                      },
                      child: const Card(
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                IconData(0xe296, fontFamily:'MaterialIcons'),
                                size: 50
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 15),
                                  Text(
                                    "Pickup / Dine in (table service)",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height:5),
                                  Text(
                                    "Check your table number",
                                    style: TextStyle(
                                      fontSize: 13
                                    ),
                                  ),
                                  SizedBox(height:15),
                                ],
                              ),
                            ],
                          )
                        )
                      )
                    )
                  ),
              
                  //Delivery icon
                  SizedBox(
                    height: 85,
                    width: 375,
                    child: GestureDetector(
                      onTap: () {
                        // If the user has not set a delivery location yet, send them to the Delivery tab first.
                        if (!DeliveryService.hasLocation) {
                          navIndex.value = 2; // Delivery tab
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Set your delivery location first."),
                              backgroundColor: Colors.lightBlue,
                            ),
                          );
                          return;
                        }

                        // Delivery location exists, so we can show the delivery map/restaurant selection page.
                        Navigator.pushNamed(context, '/deliverymap');
                      },
                      child: const Card(
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                IconData(0xe40a, fontFamily:'MaterialIcons'),
                                size: 50,
                              ),
                              SizedBox(width:10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 15),
                                  Text(
                                    "Delivery",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height:5),
                                  Text(
                                    "To your door in 30-40 minutes",
                                    style: TextStyle(
                                      fontSize: 13
                                    ),
                                  ),
                                  SizedBox(height:15),
                                ],
                              ),
                            ],
                          )
                        ),
                        
                      )
                    )
                  ),
              
                ],
              ),
            ),
          ],
        )
      );
  }
}
