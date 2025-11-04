import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../provider/nav_bar_provider.dart';
import '../screens/home_screen.dart';
import '../screens/favourite_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavBarProvider>();

    final iconList = <IconData>[
      Icons.home,
      Icons.favorite,
      Icons.shopping_cart,
      Icons.person,
    ];

    final screens = const [
      HomeScreen(),
      FavouriteScreen(),
      CartScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      extendBody: true, // for smooth FAB + notch animation
      body: screens[navProvider.currentIndex],

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example: FAB could open Cart or Add Product screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CartScreen()),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.dark_mode),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: navProvider.currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
        onTap: navProvider.setIndex,
      ),
    );
  }
}
