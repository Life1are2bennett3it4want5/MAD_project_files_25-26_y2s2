import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCategory {
  final String title;
  final String imagePath;
  final List<MenuItem> items;

  MenuCategory({
    required this.title,
    required this.imagePath,
    required this.items,
  });
}

class MenuItem {
  final String name;
  final String price;
  final String imagePath;
  final String description;

  MenuItem(this.name, this.price, this.imagePath, [this.description = '']);
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  static const Color _orangeBackground = Color.fromARGB(172, 90, 63, 32);

  final List<MenuCategory> _categories = [
    MenuCategory(
      title: "Burgers, Pasta and Mains",
      imagePath: 'assets/img/Main.png',
      items: [
        MenuItem(
            "Spaghetti Carbonara",
            "\$20",
            'assets/menu/Spaghetti-Carbonara.webp',
            'A creamy parmesan sauce lathered on Spaghetti with bits of crispy pancetta'),
        MenuItem(
          "Angus Beef Burger",
          "\$18",
          'assets/menu/AngusBeefBurger.jpg',
          "150g of Angus Beef, flame-grilled with applewood",
        ),
      ],
    ),
    MenuCategory(
      title: "Appetizers",
      imagePath: 'assets/img/Appetizers.png',
      items: [
        MenuItem("Calamari Rings", "\$8", 'assets/menu/CalamariRings.jpeg',
            'Deep Fried squid rings coated in a crispy batter'),
        MenuItem("Oyster Fry", "\$10", 'assets/menu/OysterFry.jpg',
            'Fresh Oysters coated with our signature spice loaded batter'),
      ],
    ),
    MenuCategory(
      title: "Fries, Onion Rings and Sides",
      imagePath: 'assets/img/Sides.png',
      items: [
        MenuItem("French Fries", "\$4.50", 'assets/menu/FrenchFries.jpg',
            'Crispy french fries, made with love'),
        MenuItem(
            "Garden Side Salad",
            "\$5.50",
            'assets/menu/GardenSideSalad.jpg',
            "Our special salad with a drizzle of secret sauce"),
        MenuItem("Onion Rings", "\$4.50", 'assets/menu/OnionRings.webp',
            "Taste the onion, feel the crunch"),
      ],
    ),
    MenuCategory(
      title: "Drinks",
      imagePath: 'assets/img/Drinks.png',
      items: [
        MenuItem("Ginger Ale", "\$3.50", 'assets/menu/GingerAle.jpg',
            "Ginger flavoured soda that makes you want second servings"),
        MenuItem("Fizzy Peach", "\$3.50", 'assets/menu/FizzyPeach.webp',
            "Peach Juice mixed with Soda"),
      ],
    ),
    MenuCategory(
      title: "Desserts",
      imagePath: 'assets/img/Desserts.png',
      items: [
        MenuItem("Pudding", "\$4", 'assets/menu/Pudding.avif',
            'Velvety smooth and sweet pudding'),
        MenuItem("Vanilla Ice Cream", "\$3", 'assets/menu/VanillaIceCream.jpg',
            'Simple, creamy and timelessly delicious'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _orangeBackground,
      body: CustomScrollView(
        slivers: [
          // Header banner with "Main Menu"
          SliverToBoxAdapter(
            child: _buildHeaderBanner(),
          ),
          // Category sections
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildCategorySection(_categories[index]);
              },
              childCount: _categories.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderBanner() {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 16),
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
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: Color.fromRGBO(255, 149, 0, 0.7),
                ),
              ),
            ),
            Center(
              child: Text(
                "Main Menu",
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

  Widget _buildCategorySection(MenuCategory category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                category.title,
                style: GoogleFonts.notoSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: category.items.length,
              itemBuilder: (context, index) {
                return _buildFoodItemCard(category.items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showItemDialog(BuildContext context, MenuItem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.notoSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 160,
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  item.price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                if (item.description.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItemCard(MenuItem item) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      child: SizedBox(
        height: 200,
        child: Container(
          decoration: BoxDecoration(
            color: _orangeBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade700, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(11)),
                child: GestureDetector(
                  onTap: () => _showItemDialog(context, item),
                  child: SizedBox(
                    height: 110,
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name,
                      style: GoogleFonts.publicSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.price,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}