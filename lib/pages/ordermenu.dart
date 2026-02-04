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

  //for main dishes
  String? selectedMain;
  String? selectedAppetizer;
  String? selectedSides;
  String? selectedDrinks;
  String? selectedDessert;
  String? tableNumber;

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

  void _resetSelections() {
    setState(() {
      selectedMain = null;
      selectedAppetizer = null;
      selectedSides = null;
      selectedDrinks = null;
      selectedDessert = null;

      if(options.length >= 6){
        options[0] = '';
        options[1] = '';
        options[2] = '';
        options[3] = '';
        options[4] = '';
        //options[5] stores table number, so do NOT clear it
      }
    });
  }

  void _showOrderModalMain(String mainTitle) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          String selectAllOptionsText = '';
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView(children: [
                const SizedBox(height: 20),
                Column(
                  children: [
                    ExpansionTile(
                        title: const Text(
                          "Main",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        children: [
                          ListTile(
                            title: Text(mainTitle),
                            trailing: selectedMain == mainTitle
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.amber,
                                  )
                                : null,
                            onTap: () {
                              setModalState(() {
                                selectedMain = mainTitle;
                              });
                              _setOption(0, mainTitle);
                            },
                          ),
                        ]),
                    ExpansionTile(
                      title: const Text(
                        "Appetizers",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        ListTile(
                          title: const Text('Calamari Rings'),
                          trailing: selectedAppetizer == 'Calamari Rings'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedAppetizer = 'Calamari Rings';
                            });
                            _setOption(1, 'Calamari Rings');
                          },
                        ),
                        ListTile(
                          title: const Text('Oyster Fry'),
                          trailing: selectedAppetizer == 'Oyster Fry'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedAppetizer = 'Oyster Fry';
                            });
                            _setOption(1, 'Oyster Fry');
                          },
                        ),
                        ListTile(
                          title: const Text('None'),
                          trailing: selectedAppetizer == 'None'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedAppetizer = 'None';
                            });
                            _setOption(1, 'None');
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: const Text(
                        "Sides",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        ListTile(
                          title: const Text('Fries'),
                          trailing: selectedSides == 'fries'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedSides = 'fries';
                            });
                            _setOption(2, 'fries');
                          },
                        ),
                        ListTile(
                          title: const Text('Salad'),
                          trailing: selectedSides == 'salad'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedSides = 'salad';
                            });
                            _setOption(2, 'salad');
                          },
                        ),
                        ListTile(
                          title: const Text('Onion Rings'),
                          trailing: selectedSides == 'Onion Rings'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedSides = 'Onion Rings';
                            });
                            _setOption(2, 'Onion Rings');
                          },
                        ),
                        ListTile(
                          title: const Text('None'),
                          trailing: selectedSides == 'None'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedSides = 'None';
                            });
                            _setOption(2, 'None');
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: const Text(
                        "Drinks",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        ListTile(
                          title: const Text('Ginger Ale'),
                          trailing: selectedDrinks == 'Ginger Ale'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedDrinks = 'Ginger Ale';
                            });
                            _setOption(3, 'Ginger Ale');
                          },
                        ),
                        ListTile(
                          title: const Text('Fizzy Peach'),
                          trailing: selectedDrinks == 'Fizzy Peach'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedDrinks = 'Fizzy Peach';
                            });
                            _setOption(3, 'Fizzy Peach');
                          },
                        ),
                        ListTile(
                          title: const Text('None'),
                          trailing: selectedDrinks == 'None'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedDrinks = 'None';
                            });
                            _setOption(3, 'None');
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: const Text(
                        "Desserts",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        ListTile(
                          title: const Text('Pudding'),
                          trailing: selectedDessert == 'Pudding'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedDessert = 'Pudding';
                            });
                            _setOption(4, 'Pudding');
                          },
                        ),
                        ListTile(
                          title: const Text('Vanilla ice cream'),
                          trailing: selectedDessert == 'Vanilla ice cream'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedDessert = 'Vanilla ice cream';
                            });
                            _setOption(4, 'Vanilla ice cream');
                          },
                        ),
                        ListTile(
                          title: const Text('None'),
                          trailing: selectedDessert == 'None'
                              ? const Icon(Icons.check_circle,
                                  color: Colors.amber)
                              : null,
                          onTap: () {
                            setModalState(() {
                              selectedDessert = 'None';
                            });
                            _setOption(4, 'None');
                          },
                        ),
                      ],
                    ),
                    Text(selectAllOptionsText,
                        style: const TextStyle(color: Colors.red))
                  ],
                ),
                const SizedBox(height: 10),
                FilledButton(
                    child: const Text("add order"),
                    onPressed: () {
                      if (options[0].isEmpty || options[1].isEmpty || options[2].isEmpty || options[3].isEmpty || options[4].isEmpty || options[5].isEmpty) {
                        setModalState(() {
                          selectAllOptionsText =
                              "Please complete all selections!";
                        });
                      } else {
                        OrderingService.addOrder(
                          table: options[5],
                          main: options[0],
                          appetizers: options[1],
                          sides: options[2],
                          drinks: options[3],
                          dessert: options[4],
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Order added')));
                        Navigator.pop(context);
                      }
                    }),
              ]),
            );
          });
        }).whenComplete(_resetSelections);
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
                    _showOrderModalMain('Spagetti Carbonara');
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
                    _showOrderModalMain('Angus Beef Burger');
                  },
                ),
              ]),
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
        ]),
        floatingActionButton: FittedBox(
            child: Stack(alignment: const Alignment(2.0, -2.0), children: [
          FloatingActionButton(
              child: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, "/ordersummaryuser");
              }),
          Container(
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
            decoration: OrderingService.getCount != 0 ?BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          color: Colors.black.withAlpha(50))
                    ],
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red,
                  ) : null,
            child: Center(
                child: Text('${OrderingService.getCount()}',
                    style: const TextStyle(color: Colors.white))),
          )
        ])));
  }
}
