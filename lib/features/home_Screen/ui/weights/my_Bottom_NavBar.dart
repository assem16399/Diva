import 'package:diva/features/home_Screen/ui/weights/custom_appbar.dart';
import 'package:diva/features/profile/ui/profile_screen.dart';
import 'package:diva/features/wishlist_screen/ui/wishlist.dart';
import 'package:flutter/material.dart';

import '../../../categeries_secreen/ui/categories_tab.dart';
import '../card.dart';
import '../home_Screen_Ui.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreenUi(),
    Catecroies(),
    const card(),
    const Wishlist(),
    const ProfileScreen()
  ];

  final _appBars = [
    const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: CustomAppBar(),
    ),
    AppBar(
      title: const Text('Category'),
    ),
    AppBar(
      title: const Text('Cart'),
    ),
    AppBar(
      title: const Text('Wishlist'),
    ),
    AppBar(
      title: const Text('Profile'),
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
      appBar: _appBars[_selectedIndex],
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Container(
                    height: 25, width: 20, child: const Icon(Icons.home)),
                backgroundColor: Colors.white,
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                    height: 25, width: 20, child: const Icon(Icons.menu_open)),
                backgroundColor: Colors.white,
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                    height: 25,
                    width: 20,
                    child: const Icon(Icons.add_shopping_cart)),
                backgroundColor: Colors.white,
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                    height: 25, width: 20, child: const Icon(Icons.favorite)),
                backgroundColor: Colors.white,
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                    height: 25, width: 20, child: const Icon(Icons.person)),
                backgroundColor: Colors.white,
                label: ""),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.pinkAccent[100],
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          iconSize: 20,
          onTap: _onItemTapped,
          elevation: 1),
    );
  }
}
