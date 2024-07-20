import 'package:flutter/material.dart';
import 'package:food_app2/src/features/view/homepage.dart';
import 'package:food_app2/src/features/view/settings.dart';

class HomePageMain extends StatefulWidget {
  const HomePageMain({super.key});

  @override
  State<HomePageMain> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  int _currentIndex = 0;

  final List _screens = [
    const HomePage(),
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.green,
    ),
    const Settings()
  ];

  void _navBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _navBar(index),
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Color(0xffeb3254),
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "home"),
            BottomNavigationBarItem(
                backgroundColor: Color(0xffeb3254),
                icon: Icon(
                  Icons.favorite_outline_rounded,
                  color: Colors.white,
                ),
                label: "favorite"),
            BottomNavigationBarItem(
                backgroundColor: Color(0xffeb3254),
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: "cart"),
            BottomNavigationBarItem(
                backgroundColor: Color(0xffeb3254),
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: "settings")
          ]),
      body: _screens[_currentIndex],
    );
  }
}
