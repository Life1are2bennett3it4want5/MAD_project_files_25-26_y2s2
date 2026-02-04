import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _UserLoginState();
}

class _UserLoginState extends State<MenuPage> {
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
              backgroundColor: Colors.white,
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
                ),
              ]),
          //Appetizers
          ExpansionTile(
            backgroundColor: Colors.white,
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
              ),
              const ListTile(title: Text("Angus Beef Burger"))
            ],
          ),
          //Sides
          ExpansionTile(
            backgroundColor: Colors.white,
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
              ),
              const ListTile(title: Text("Angus Beef Burger"))
            ],
          ),
          //Drinks
          ExpansionTile(
            backgroundColor: Colors.white,
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
              ),
              const ListTile(title: Text("Angus Beef Burger"))
            ],
          ),
          //Desserts
          ExpansionTile(
            backgroundColor: Colors.white,
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
              ),
              const ListTile(title: Text("Angus Beef Burger"))
            ],
          ),
        ]),
        
        );
  }
}
