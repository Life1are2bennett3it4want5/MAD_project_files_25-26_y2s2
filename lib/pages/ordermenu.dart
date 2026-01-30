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
  String? selectedMain;
  String? selectedAppetizer;
  String? selectedSides;
  String? selectedDrinks;
  String? selectedDessert;

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
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setModalState) {
                              return ListView(
                                  children: [
                                const SizedBox(height: 20),
                                Column(
                                  children: [
                                    ExpansionTile(
                                      title: const Text("Main", style: TextStyle(fontWeight: FontWeight.bold),),
                                      children:[
                                        ListTile(
                                        title: const Text('Angus Beef Burger'),
                                        trailing: selectedMain == 'Angus Beef Burger' ? const Icon(Icons.check_circle, color: Colors.amber, ) : null,
                                        onTap: () {
                                          setModalState(() { selectedMain = 'Angus Beef Burger'; });
                                          _setOption(0, 'Angus Beef Burger');
                                              },
                                            ),
                                      ] 
                                    ),
                                    ExpansionTile(
                                      title: const Text("Appetizers", style: TextStyle(fontWeight: FontWeight.bold),),
                                      children: [
                                        ListTile(
                                          title: const Text('Calamari Rings'),
                                          trailing: selectedAppetizer == 'Calamari Rings' ? const Icon(Icons.check_circle, color: Colors.amber) : null,
                                          onTap: () {
                                            setModalState(() { selectedAppetizer = 'Calamari Rings'; });
                                            _setOption(1, 'Calamari Rings');
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Oyster Fry'),
                                          trailing: selectedAppetizer == 'Oyster Fry' ? const Icon(Icons.check_circle, color: Colors.amber) : null,
                                          onTap: () {
                                            setModalState(() { selectedAppetizer = 'Oyster Fry'; });
                                            _setOption(1, 'Oyster Fry');
                                          },
                                        ),
                                      ],
                                    ),

                                    ExpansionTile(
                                      title: const Text("Sides", style: TextStyle(fontWeight: FontWeight.bold),),
                                      children: [
                                        ListTile(
                                          title: const Text('Fries'),
                                          trailing: selectedSides == 'fries' ? const Icon(Icons.check_circle, color: Colors.amber) : null,
                                          onTap: () {
                                            setModalState(() { selectedSides = 'fries'; });
                                            _setOption(2, 'fries');
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Salad'),
                                          trailing: selectedSides == 'salad' ? const Icon(Icons.check_circle, color: Colors.amber) : null,
                                          onTap: () {
                                            setModalState(() { selectedSides = 'salad'; });
                                            _setOption(2, 'salad');
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Onion Rings'),
                                          trailing: selectedSides == 'Onion Rings' ? const Icon(Icons.check_circle, color: Colors.amber) : null,
                                          onTap: () {
                                            setModalState(() { selectedSides = 'Onion Rings'; });
                                            _setOption(2, 'Onion Rings');
                                          },
                                        ),
                                      ],
                                    ),

                                    ExpansionTile(
                                      title: const Text("Drinks", style: TextStyle(fontWeight: FontWeight.bold),),
                                      children: [
                                        ListTile(
                                          title: const Text('Ginger Ale'),
                                          trailing: selectedDrinks == 'Ginger Ale' ? const Icon(Icons.check_circle, color: Colors.amber) : null,
                                          onTap: () {
                                            setModalState(() { selectedDrinks = 'Ginger Ale'; });
                                            _setOption(3, 'Ginger Ale');
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Fizzy Peach'),
                                          trailing: selectedDrinks == 'Fizzy Peach' ? const Icon(Icons.check_circle, color: Colors.amber) : null,
                                          onTap: () {
                                            setModalState(() { selectedDrinks = 'Fizzy Peach'; });
                                            _setOption(3, 'Fizzy Peach');
                                          },
                                        ),
                                      ],
                                    ),

                                    ExpansionTile(
                                      title: const Text("Desserts", style: TextStyle(fontWeight: FontWeight.bold),),
                                      children: [
                                        ListTile(
                                          title: const Text('Pudding'),
                                          trailing: selectedDessert == 'Pudding' ? const Icon(Icons.check_circle, color: Colors.amber) : null,
                                          onTap: () {
                                            setModalState(() { selectedDessert = 'Pudding'; });
                                            _setOption(4, 'Pudding');
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Vanilla ice cream'),
                                          trailing: selectedDessert == 'Vanilla ice cream' ? const Icon(Icons.check_circle, color: Colors.amber) : null,
                                          onTap: () {
                                            setModalState(() { selectedDessert = 'Vanilla ice cream'; });
                                            _setOption(4, 'Vanilla ice cream');
                                          },
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
                              ]);
                        });
                  });
  })],
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
