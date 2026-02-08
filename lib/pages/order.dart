import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(172, 90, 63, 32),
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          flexibleSpace: _buildHeaderBanner(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
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
                                  IconData(0xe296, fontFamily: 'MaterialIcons'),
                                  size: 50),
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
                                  SizedBox(height: 5),
                                  Text(
                                    "Check your table number",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            ],
                          ))))),

                  //Delivery icon
                  SizedBox(
                      height: 85,
                      width: 375,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/delivery");
                          },
                          child: const Card(
                            child: Center(
                                child: Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  IconData(0xe40a, fontFamily: 'MaterialIcons'),
                                  size: 50,
                                ),
                                SizedBox(width: 10),
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
                                    SizedBox(height: 5),
                                    Text(
                                      "To your door in 30-40 minutes",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                ),
                              ],
                            )),
                          ))),
                ],
              ),
            ),
          ],
        ));
  }
}

Widget _buildHeaderBanner() {
  return Container(
    height: 120,
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(255, 149, 0, 0.7),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Text(
              "Order",
              style: GoogleFonts.notoSans(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}