import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../history _screen/history_screen.dart';
import 'home_page_maps_screen.dart';
import '../main_profile_screen/main_profile_screen.dart';

class HomePageMapsScreen extends StatefulWidget {
  const HomePageMapsScreen({super.key});

  @override
  State<HomePageMapsScreen> createState() => _HomePageMapsScreenState();
}

class _HomePageMapsScreenState extends State<HomePageMapsScreen> {
  int currentIndex = 0;
  bool light = true;
  bool showDialogBool = false;

  List<Widget> screens = [
    HomePage(),
    HistoryScreen(),
    MainProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade300,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xffFF6A03),
        unselectedItemColor: const Color(0xffA2A2A2),
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
