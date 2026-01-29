import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'orderingservice.dart';

class OrderMenuPage extends StatefulWidget {
  const OrderMenuPage({super.key});
  @override
  State<OrderMenuPage> createState() => _UserLoginState();
}

class _UserLoginState extends State<OrderMenuPage> {
  bool _customIcon = false;
  List<String> options = [];

  @override
  void initState() {
    super.initState();
    options = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Main Menu'),
          centerTitle: true,
          
        ),
        body: ListView(children: [
          //Main
          ExpansionTile(
              backgroundColor: Colors.lightBlueAccent,
              leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/img/Main.png')),
              title: Text("Burgers, Pasta and Mains",
                  style: GoogleFonts.notoSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Icon(_customIcon
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down),
              children: [
                //Spaghetti Carbonara
                ListTile(
                  title: Text(
                    "Spagetti Carbonara",
                    style: GoogleFonts.publicSans(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500
                    )
                  ),

                  subtitle: const Text(
                      "A creamy parmesan sauce lathered on Spaghetti with bits of crispy pancetta",
                      style: TextStyle(fontSize: 13)
                  ),

                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/menu/Spaghetti-Carbonara.webp')
                  ),

                  trailing: const Text("\$20", style: TextStyle(fontSize: 20)),

                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 600,
                        );
                      }
                    );
                  },
                ),
                //Angus Beef Burger
                ListTile(
                  title: Text(
                    "Angus Beef Burger",
                    style: GoogleFonts.publicSans(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500
                    )
                  ),
                  subtitle: const Text(
                    "150g of Angus Beef, flame-grilled with applewood",
                    style: TextStyle(fontSize: 13),
                  ),
                  leading: const CircleAvatar(
                    radius:20,
                    backgroundImage: AssetImage('assets/menu/AngusBeefBurger.jpg'),
                  ),
                  trailing: const Text("\$18", style: TextStyle(fontSize: 20),),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 600,
                          width: double.infinity,
                          child: Column(
                            children:[
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  //add more sides options here
                                  const SizedBox(width: 20),
                                  const Text('choose sides:'),
                                  const SizedBox(width:10),
                                  Card(
                                    color: Colors.orangeAccent,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (options.isNotEmpty) {
                                            options[0] = 'fries';
                                          } else {
                                            options = [...options, 'fries'];
                                          }
                                          print(options); //debug
                                        });
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text('fries'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width:10),
                                  Card(
                                    color: Colors.orangeAccent,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (options.isNotEmpty) {
                                            options[0] = 'salad';
                                          } else {
                                            options = [...options, 'salad'];
                                          }
                                          print(options); //debug
                                        });
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text('salad'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height:10),
                              FilledButton(
                                child: const Text("add order"),
                                onPressed: () {

                                }
                              )
                            ]
                          )
                        );
                      }
                    );
                  }
                ),


              ],
              onExpansionChanged: (bool expanded) {
                setState(
                  () => _customIcon = expanded,
                );
              }),
          //Appetizers
          ExpansionTile(
              backgroundColor: Colors.lightBlueAccent,
              leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/img/Appetizers.png')),
              title: Text("Appetizers",
                  style: GoogleFonts.notoSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Icon(_customIcon
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down),
              children: [
                ListTile(
                  title: Text("Spagetti Carbonara",
                      style: GoogleFonts.publicSans(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  subtitle: const Text(
                      "A creamy parmesan sauce lathered on Spaghetti with bits of crispy pancetta",
                      style: TextStyle(fontSize: 13)),
                  leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/menu/Spaghetti-Carbonara.webp')),
                  trailing: const Text("\$20", style: TextStyle(fontSize: 20)),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 600,
                          );
                        });
                  },
                ),
                const ListTile(title: Text("Angus Beef Burger"))
              ],
              onExpansionChanged: (bool expanded) {
                setState(
                  () => _customIcon = expanded,
                );
              }),
          //Sides
          ExpansionTile(
              backgroundColor: Colors.lightBlueAccent,
              leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/img/Sides.png')),
              title: Text("Fries, Onion Rings and Sides",
                  style: GoogleFonts.notoSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Icon(_customIcon
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down),
              children: [
                ListTile(
                  title: Text("Spagetti Carbonara",
                      style: GoogleFonts.publicSans(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  subtitle: const Text(
                      "A creamy parmesan sauce lathered on Spaghetti with bits of crispy pancetta",
                      style: TextStyle(fontSize: 13)),
                  leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/menu/Spaghetti-Carbonara.webp')),
                  trailing: const Text("\$20", style: TextStyle(fontSize: 20)),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 600,
                          );
                        });
                  },
                ),
                const ListTile(title: Text("Angus Beef Burger"))
              ],
              onExpansionChanged: (bool expanded) {
                setState(
                  () => _customIcon = expanded,
                );
              }),
          //Drinks
          ExpansionTile(
              backgroundColor: Colors.lightBlueAccent,
              leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/img/Drinks.png')),
              title: Text("Drinks",
                  style: GoogleFonts.notoSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Icon(_customIcon
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down),
              children: [
                ListTile(
                  title: Text("Spagetti Carbonara",
                      style: GoogleFonts.publicSans(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  subtitle: const Text(
                      "A creamy parmesan sauce lathered on Spaghetti with bits of crispy pancetta",
                      style: TextStyle(fontSize: 13)),
                  leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/menu/Spaghetti-Carbonara.webp')),
                  trailing: const Text("\$20", style: TextStyle(fontSize: 20)),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 600,
                          );
                        });
                  },
                ),
                const ListTile(title: Text("Angus Beef Burger"))
              ],
              onExpansionChanged: (bool expanded) {
                setState(
                  () => _customIcon = expanded,
                );
              }),
          //Desserts
          ExpansionTile(
              backgroundColor: Colors.lightBlueAccent,
              leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/img/Desserts.png')),
              title: Text("Desserts",
                  style: GoogleFonts.notoSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Icon(_customIcon
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down),
              children: [
                ListTile(
                  title: Text("Spagetti Carbonara",
                      style: GoogleFonts.publicSans(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  subtitle: const Text(
                      "A creamy parmesan sauce lathered on Spaghetti with bits of crispy pancetta",
                      style: TextStyle(fontSize: 13)),
                  leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/menu/Spaghetti-Carbonara.webp')),
                  trailing: const Text("\$20", style: TextStyle(fontSize: 20)),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 600,
                          );
                        });
                  },
                ),
                const ListTile(title: Text("Angus Beef Burger"))
              ],
              onExpansionChanged: (bool expanded) {
                setState(
                  () => _customIcon = expanded,
                );
              }),
        ]));
  }
}
