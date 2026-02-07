import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _UserLoginState();
}

class _UserLoginState extends State<MenuPage> {
  //Mains
  final mainMenuItems = [
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
          backgroundImage: AssetImage('assets/menu/Spaghetti-Carbonara.webp')),
      trailing: const Text("\$18", style: TextStyle(fontSize: 20)),
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
        backgroundImage: AssetImage('assets/menu/AngusBeefBurger.jpg'),
      ),
      trailing: const Text(
        "\$15",
        style: TextStyle(fontSize: 20),
      ),
    ),
  ];
  //Appetizers
  final appetizerMenuItems = [
    //Calamari Rings
    ListTile(
      title: Text("Calamari Rings",
          style: GoogleFonts.publicSans(
              fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: const Text(
        "Deep Fried squid rings coated in a crispy batter",
        style: TextStyle(fontSize: 13),
      ),
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/menu/CalamariRings.jpeg'),
      ),
      trailing: const Text(
        "\$8",
        style: TextStyle(fontSize: 20),
      ),
    ),
    //Oyster Fry
    ListTile(
      title: Text("Oyster Fry",
          style: GoogleFonts.publicSans(
              fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: const Text(
        "Fresh Oysters coated with our signature spice loaded batter",
        style: TextStyle(fontSize: 13),
      ),
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/menu/OysterFry.jpg'),
      ),
      trailing: const Text(
        "\$10",
        style: TextStyle(fontSize: 20),
      ),
    ),
  ];
  //Sides
  final sideMenuItems = [
    //French Fries
    ListTile(
      title: Text("French Fries",
          style: GoogleFonts.publicSans(
              fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: const Text(
        "Crispy french fries, made with love",
        style: TextStyle(fontSize: 13),
      ),
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/menu/FrenchFries.jpg'),
      ),
      trailing: const Text(
        "\$4.50",
        style: TextStyle(fontSize: 20),
      ),
    ),
    //Garden Side Salad
    ListTile(
      title: Text("Garden Side Salad",
          style: GoogleFonts.publicSans(
              fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: const Text(
        "Our special salad with a drizzle of secret sauce",
        style: TextStyle(fontSize: 13),
      ),
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/menu/GardenSideSalad.jpg'),
      ),
      trailing: const Text(
        "\$5.50",
        style: TextStyle(fontSize: 20),
      ),
    ),
    //Onion Rings
    ListTile(
      title: Text("Onion Rings",
          style: GoogleFonts.publicSans(
              fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: const Text(
        "Taste the onion, feel the crunch",
        style: TextStyle(fontSize: 13),
      ),
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/menu/OnionRings.webp'),
      ),
      trailing: const Text(
        "\$4.50",
        style: TextStyle(fontSize: 20),
      ),
    ),
  ];
  //Drinks
  final drinkMenuItems = [
    //Ginger Ale
    ListTile(
      title: Text("Ginger Ale",
          style: GoogleFonts.publicSans(
              fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: const Text(
        "Ginger flavoured soda that makes you want second servings",
        style: TextStyle(fontSize: 13),
      ),
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/menu/GingerAle.jpg'),
      ),
      trailing: const Text(
        "\$3.50",
        style: TextStyle(fontSize: 20),
      ),
    ),
    //Fizzy Peach
    ListTile(
      title: Text("Fizzy Peach",
          style: GoogleFonts.publicSans(
              fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: const Text(
        "Peach Juice mixed with Soda",
        style: TextStyle(fontSize: 13),
      ),
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/menu/FizzyPeach.webp'),
      ),
      trailing: const Text(
        "\$3.50",
        style: TextStyle(fontSize: 20),
      ),
    ),
  ];
  //Desserts
  final dessertMenuItems = [
    //Pudding
    ListTile(
      title: Text("Pudding",
          style: GoogleFonts.publicSans(
              fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: const Text(
        "Velvety smooth and sweet pudding",
        style: TextStyle(fontSize: 13),
      ),
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/menu/Pudding.avif'),
      ),
      trailing: const Text(
        "\$4",
        style: TextStyle(fontSize: 20),
      ),
    ),
    //Vanilla Ice Cream
    ListTile(
      title: Text("Vanilla Ice Cream",
          style: GoogleFonts.publicSans(
              fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: const Text(
        "Simple, creamy and timelessly delicious",
        style: TextStyle(fontSize: 13),
      ),
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/menu/VanillaIceCream.jpg'),
      ),
      trailing: const Text(
        "\$3",
        style: TextStyle(fontSize: 20),
      ),
    ),
  ];

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
                radius: 25, backgroundImage: AssetImage('assets/img/Main.png')),
            title: Text("Burgers, Pasta and Mains",
                style: GoogleFonts.notoSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
            children: mainMenuItems),
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
          children: appetizerMenuItems,
        ),
        //Sides
        ExpansionTile(
          backgroundColor: Colors.white,
          leading: const CircleAvatar(
              radius: 25, backgroundImage: AssetImage('assets/img/Sides.png')),
          title: Text("Fries, Onion Rings and Sides",
              style: GoogleFonts.notoSans(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
          children: sideMenuItems,
        ),
        //Drinks
        ExpansionTile(
          backgroundColor: Colors.white,
          leading: const CircleAvatar(
              radius: 25, backgroundImage: AssetImage('assets/img/Drinks.png')),
          title: Text("Drinks",
              style: GoogleFonts.notoSans(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
          children: drinkMenuItems,
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
          children: dessertMenuItems,
        ),
      ]),
    );
  }
}
