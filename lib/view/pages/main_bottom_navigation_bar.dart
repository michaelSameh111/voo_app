// import 'package:flutter/material.dart';
// import 'package:voo_app/view/pages/history_screen.dart';
// import 'package:voo_app/view/pages/home_page_maps_screen.dart';
// import 'package:voo_app/view/pages/main_profile_screen.dart';
//
// class MainBottomNavigationBar extends StatefulWidget {
//   const MainBottomNavigationBar({Key? key}) : super(key: key);
//
//   @override
//   State<MainBottomNavigationBar> createState() => _MainBottomNavigationBarState();
// }
//
// class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
//   int currentIndex = 0;
//
//   List <Widget> screens = [
//     HomePageMapsScreen(),
//     MainProfileScreen(),
//     HistoryScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens [currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: const Color(0xff0038A7),
//         unselectedItemColor: const Color(0xffA2A2A2),
//         currentIndex: currentIndex,
//         onTap: (int index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }
