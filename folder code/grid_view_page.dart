import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contoh Navigasi',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/Basket': (context) =>
            const MenuPage(menuTitle: 'Pantai', icon: Icons.beach_access),
        '/Sepak Bola': (context) =>
            const MenuPage(menuTitle: 'Gunung', icon: Icons.terrain),
        '/Mie Ayam': (context) =>
            const MenuPage(menuTitle: 'Budaya', icon: Icons.museum),
        '/Bakso': (context) =>
            const MenuPage(menuTitle: 'Kuliner', icon: Icons.restaurant),
        '/Rumah': (context) =>
            const MenuPage(menuTitle: 'Rumah', icon: Icons.home),
        '/Lampung': (context) =>
            const MenuPage(menuTitle: 'Mall', icon: Icons.shopping_cart),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void goTo(BuildContext context, String route) {
    debugPrint("Pindah ke: $route"); // DEBUG
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const MenuPage(menuTitle: 'Halaman Isi', icon: Icons.arrow_back),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          menuButton(
            context,
            'Basket',
            Icons.sports_basketball,
            '/Basket',
            const Color.fromARGB(255, 0, 0, 0),
          ),
          menuButton(
            context,
            'Sepak Bola',
            Icons.sports_football,
            '/Sepak Bola',
            const Color.fromARGB(255, 4, 0, 0),
          ),
          menuButton(
            context,
            'Mie Ayam',
            Icons.food_bank,
            '/Mie Ayam',
            const Color.fromARGB(255, 0, 0, 0),
          ),
          menuButton(
            context,
            'Bakso',
            Icons.restaurant,
            '/Bakso',
            const Color.fromARGB(255, 0, 0, 0),
          ),
          menuButton(
            context,
            'Rumah',
            Icons.home,
            '/Rumah',
            const Color.fromARGB(255, 0, 0, 0),
          ),
          menuButton(
            context,
            'Lampung',
            Icons.flag,
            '/Lampung',
            const Color.fromARGB(255, 0, 0, 0),
          ),
        ],
      ),
    );
  }

  Widget menuButton(
    BuildContext context,
    String text,
    IconData icon,
    String route,
    Color color,
  ) {
    return ElevatedButton.icon(
      onPressed: () => goTo(context, route),
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;

  const MenuPage({super.key, required this.menuTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menuTitle)),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(icon),
          label: const Text('Kembali'),
        ),
      ),
    );
  }
}
