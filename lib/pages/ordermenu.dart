import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'orderingservice.dart';

class OrderMenuPage extends StatefulWidget {
  const OrderMenuPage({super.key});
  @override
  State<OrderMenuPage> createState() => _UserLoginState();
}

class _UserLoginState extends State<OrderMenuPage> {
  List<String> options = [];
  bool _argsHandled = false;

  @override
  void initState() {
    super.initState();
    options = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_argsHandled) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is String && args.isNotEmpty) {
        _setOption(5, args); // index 5 reserved for table
      }
      _argsHandled = true;
    }
  }

  void _setOption(int idx, String val) {
    setState(() {
      while (options.length <= idx) {
        options.add('');
      }
      options[idx] = val;
    });
    print(options); //debug
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
                radius: 25, backgroundImage: AssetImage('assets/img/Main.png')),
            title: Text("Burgers, Pasta and Mains",
                style: GoogleFonts.notoSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
            children: [
              //Spaghetti Carbonara
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

              //Angus Beef Burger
              ListTile(
                  title: Text("Angus Beef Burger",
                      style: GoogleFonts.publicSans(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  subtitle: const Text(
                    "150g of Angus Beef, flame-grilled with applewood",
                    style: TextStyle(fontSize: 13),
                  ),
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage('assets/menu/AngusBeefBurger.jpg'),
                  ),
                  trailing: const Text(
                    "\$18",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                              height: 600,
                              width: double.infinity,
                              child: Column(children: [
                                const SizedBox(height: 20),
                                Column(
                                  children: [
                                    //add more sides options here
                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        const Text(
                                          'choose Main:',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(width: 10),
                                        Card(
                                          color: Colors.orangeAccent,
                                          child: GestureDetector(
                                            onTap: () {
                                              _setOption(
                                                  0, 'Angus Beef Burger');
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text('Angus Beef Burger'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        const Text(
                                          'choose Appetizer:',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(width: 10),
                                        Card(
                                          color: Colors.orangeAccent,
                                          child: GestureDetector(
                                            onTap: () {
                                              _setOption(1, 'Calamari Rings');
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text('Calamari \nRings'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Card(
                                          color: Colors.orangeAccent,
                                          child: GestureDetector(
                                            onTap: () {
                                              _setOption(1, 'Oyster fry');
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text('Oyster Fry'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        const Text(
                                          'choose sides:',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(width: 10),
                                        Card(
                                          color: Colors.orangeAccent,
                                          child: GestureDetector(
                                            onTap: () {
                                              _setOption(2, 'fries');
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text('fries'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Card(
                                          color: Colors.orangeAccent,
                                          child: GestureDetector(
                                            onTap: () {
                                              _setOption(2, 'salad');
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text('salad'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Card(
                                          color: Colors.orangeAccent,
                                          child: GestureDetector(
                                            onTap: () {
                                              _setOption(2, 'Onion Rings');
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text('Onion Rings'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        const Text(
                                          'choose drink:',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(width: 10),
                                        Card(
                                          color: Colors.orangeAccent,
                                          child: GestureDetector(
                                            onTap: () {
                                              _setOption(3, 'Ginger Ale');
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text('Ginger Ale'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Card(
                                          color: Colors.orangeAccent,
                                          child: GestureDetector(
                                            onTap: () {
                                              _setOption(3, 'Fizzy Peach');
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text('Fizzy Peach'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        const Text(
                                          'choose dessert:',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(width: 10),
                                        Card(
                                          color: Colors.orangeAccent,
                                          child: GestureDetector(
                                            onTap: () {
                                              _setOption(4, 'Pudding');
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text('Pudding'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Card(
                                          color: Colors.orangeAccent,
                                          child: GestureDetector(
                                            onTap: () {
                                              _setOption(
                                                  4, 'Vanilla ice cream');
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text('Vanilla ice cream'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                FilledButton(
                                    child: const Text("add order"),
                                    onPressed: () {
                                      // require at least 6 entries: main, appetizers, sides, drinks, dessert, table
                                      if (options.length == 6) {
                                        OrderingService.addOrder(
                                          table: options[5],
                                          main: options[0],
                                          appetizers: options[1],
                                          sides: options[2],
                                          drinks: options[3],
                                          dessert: options[4],
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Order added')),
                                        );
                                        Navigator.pop(context);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Please complete selections (including table)')),
                                        );
                                      }
                                    })
                              ]));
                        });
                  }),
            ],
          ),
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
          ),
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
          ),
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
          ),
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
          ),
        ]));
  }
}
