import 'package:ebook_app/screens/cart/cart_page.dart';
import 'package:ebook_app/screens/home/home_page.dart';
import 'package:ebook_app/screens/save/save_page.dart';
import 'package:ebook_app/screens/user/user_page.dart';
import 'package:ebook_app/themes.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  static const nameRoute = '/';
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  final _screens = [
    HomePage(),
    SavePage(),
    CartPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 15),
              child: Image.asset(
                'assets/icons/icon-home.png',
                width: 20,
                color: _selectedIndex == 0 ? greenColor : greyColor,
              ),
            ), 
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 15),
              child: Image.asset(
                'assets/icons/icon-save-nav.png',
                width: 14,
                color: _selectedIndex == 1 ? greenColor : greyColor,
              ),
            ), 
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 15),
              child: Image.asset(
                'assets/icons/icon-cart.png',
                width: 20,
                color: _selectedIndex == 2 ? greenColor : greyColor,
              ),
            ), 
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 15),
              child: Image.asset(
                'assets/icons/icon-user.png',
                width: 18,
                color: _selectedIndex == 3 ? greenColor : greyColor,
              ),
            ), 
            label: ''
          ),
        ],
      );
    }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: Stack(
        children: _screens
              .asMap()
              .map((i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: _selectedIndex != i,
                  child: screen,
                )))
              .values
              .toList()
      ),
    );
  }
}