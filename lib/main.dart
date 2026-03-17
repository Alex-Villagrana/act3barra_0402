import 'package:flutter/material.dart';
import 'mispantallas/pantalla1.dart';
import 'mispantallas/pantalla2.dart';
import 'mispantallas/pantalla3.dart';
import 'mispantallas/pantalla4.dart';
import 'mispantallas/pantalla5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skate Shop',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainStoreController(),
    );
  }
}

class MainStoreController extends StatefulWidget {
  const MainStoreController({super.key});

  @override
  State<MainStoreController> createState() => _MainStoreControllerState();
}

class _MainStoreControllerState extends State<MainStoreController> {
  bool isMenuOpen = false;
  int currentIndex = 0; // 0: Feed, 1: Patinetas, etc.

  String _getCurrentTitle() {
    switch (currentIndex) {
      case 0:
        return "ZON\nSKATE SHOP";
      case 1:
        return "Patinetas";
      case 2:
        return "Pantalones";
      case 3:
        return "Camisetas";
      case 4:
        return "Sudaderas";
      case 5:
        return "Tenis";
      default:
        return "Skate Shop";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(_getCurrentTitle()),
      body: Stack(
        children: [
          // Main content area
          IndexedStack(
            index: currentIndex,
            children: <Widget>[
              _buildFeedScreen(),
              buildPatinetasScreen(),
              buildPantalonesScreen(),
              buildCamisetasScreen(),
              buildSudaderasScreen(),
              buildTenisScreen(),
            ],
          ),

          // Dark overlay when menu is open
          if (isMenuOpen)
            GestureDetector(
              onTap: () => setState(() => isMenuOpen = false),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),

          // Side menu
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: isMenuOpen ? 0 : -MediaQuery.of(context).size.width * 0.75,
            top: 0,
            bottom: 0,
            child: _buildSideMenu(),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _customAppBar(String title) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () => setState(() => isMenuOpen = !isMenuOpen),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildFeedScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          _buildNewArrivalsBanner(),
          const SizedBox(height: 40),
          _buildProductCard("ELEMENT", 'https://raw.githubusercontent.com/Alex-Villagrana/imagen_act11/refs/heads/main/elementsakte.jpg', const Color(0xFFE3F2FD)),
          const SizedBox(height: 20),
          _buildProductCard("SANTA CRUZ", 'https://raw.githubusercontent.com/Alex-Villagrana/imagen_act11/refs/heads/main/santacruzskate.webp', const Color(0xFFFBE9E7)),
        ],
      ),
    );
  }

  Widget _buildSideMenu() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: const Color(0xFFFFEBEE),
      child: SafeArea(
        child: Column(
          children: <Widget>[
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text("MENÚ ★", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => setState(() => isMenuOpen = false)),
                ],
              ),
            ),
             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 16.0),
               child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.red),
                  hintText: "Buscar",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide.none),
                ),
                         ),
             ),
            const SizedBox(height: 20),
            _menuItem("Inicio", Icons.home, 0),
            _menuItem("Patinetas", Icons.skateboarding, 1),
            _menuItem("Pantalones", Icons.straighten, 2),
            _menuItem("Camisetas", Icons.checkroom, 3),
            _menuItem("Sudaderas", Icons.waves, 4),
            _menuItem("Tenis", Icons.ice_skating, 5),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(String title, IconData icon, int index) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      trailing: const Text("+", style: TextStyle(color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold)),
      onTap: () {
        setState(() {
          currentIndex = index;
          isMenuOpen = false;
        });
      },
    );
  }

  Widget _buildNewArrivalsBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "NUEVOS\nPRODUCTOS",
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String title, String imageUrl, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              imageUrl,
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
