import 'package:diva/features/cart/ui/cart_tab.dart';
import 'package:diva/features/home_Screen/ui/categories_tab.dart';
import 'package:diva/features/home_Screen/ui/home_tab.dart';
import 'package:diva/features/home_Screen/ui/wishlist_tab.dart';
import 'package:flutter/material.dart';

import '../../features/home_Screen/ui/widgets/home_custom_appbar.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeTab(),
    const CategoriesTab(),
    const CartTab(),
    const WishlistTab(),
  ];

  final _appBars = [
    const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: HomeCustomAppBar(),
    ),
    AppBar(
      title: const Text('Categories'),
    ),
    AppBar(
      title: const Text('Cart'),
    ),
    AppBar(
      title: const Text('Wishlist'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars.elementAt(_selectedIndex),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(height: 25, width: 20, child: Icon(Icons.home)),
            backgroundColor: Colors.white,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              width: 20,
              child: Icon(Icons.menu_open),
            ),
            backgroundColor: Colors.white,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              width: 20,
              child: Icon(Icons.add_shopping_cart),
            ),
            backgroundColor: Colors.white,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(height: 25, width: 20, child: Icon(Icons.favorite)),
            backgroundColor: Colors.white,
            label: '',
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent[100],
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        iconSize: 20,
        onTap: _onItemTapped,
        elevation: 1,
      ),
    );
  }
}
