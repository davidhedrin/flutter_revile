import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_revile/screens/account_screen.dart';
import 'package:flutter_revile/screens/cart_screen.dart';
import 'package:flutter_revile/screens/favorite_screen.dart';
import 'package:flutter_revile/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String id = 'main-screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white12,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: 'Home',
              backgroundColor: Colors.white10,
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1 ? IconlyBold.buy : IconlyLight.buy),
              label: 'Cart',
              backgroundColor: Colors.white10,
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2 ? IconlyBold.heart : IconlyLight.heart),
              label: 'Save',
              backgroundColor: Colors.white10,
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3 ? IconlyBold.setting : IconlyLight.setting),
              label: 'Settings',
              backgroundColor: Colors.white10,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
