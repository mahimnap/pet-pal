import 'package:flutter/material.dart';
import 'package:petpalui/view/pages/searchPage.dart';
//import 'package:petpalui/view/pages/favoritesPage.dart';
import 'package:petpalui/view/pages/profilePage.dart';
import 'package:petpalui/view/pages/homePage.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        /*BottomNavigationBarItem(
          backgroundColor: Colors.blue,
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),*/
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      onTap: onItemTapped,
    );
  }
}
