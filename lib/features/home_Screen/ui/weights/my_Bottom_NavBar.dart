import 'package:flutter/material.dart';

import '../Catecroies.dart';
import '../card.dart';
import '../home_Screen_Ui.dart';
import '../likes.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreenUi(),
    const Catecroies(),
    const card(),
    const likes()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
